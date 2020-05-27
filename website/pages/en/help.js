/**
 * Copyright (c) 2017-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

const React = require('react');

const CompLibrary = require('../../core/CompLibrary.js');

const Container = CompLibrary.Container;
const GridBlock = CompLibrary.GridBlock;

function Help(props) {
  const {config: siteConfig, language = ''} = props;
  const {baseUrl, docsUrl} = siteConfig;
  const docsPart = `${docsUrl ? `${docsUrl}/` : ''}`;
  const langPart = `${language ? `${language}/` : ''}`;
  const docUrl = doc => `${baseUrl}${docsPart}${langPart}${doc}`;

  const supportLinks = [
    {
      content: `Learn more using the [documentation on this site.](${docUrl(
        'implementation_guides/workshops',
      )})`,
      title: 'Browse Docs',
    },
    {
      content: 'Ask questions about the documentation and project. You can join [here](https://slack.pact.io).',
      title: 'Join the Pact Slack community',
    },{
      content: 'Look for questions tagged with [pact](https://stackoverflow.com/questions/tagged/pact).',
      title: 'Search on Stack Overflow'
    },{
      content: 'View our roadmap, request a feature, or add your vote to an existing one at [Canny](https://pact.canny.io/)',
      title: 'Request a feature'
    },
    {
      content: "Find out what's new with this project by reading our [blog](http://blog.pact.io)",
      title: 'Stay up to date',
    },{
      content: 'Please create an executable example and raise an issue in the [repository](https://github.com/pact-foundation) of the appropriate implementation.',
      title: 'Found a bug?'
    }
  ];

  return (
    <div className="docMainWrapper wrapper">
      <Container className="mainContainer documentContainer postContainer">
        <div className="post">
          <header className="postHeader">
            <h1>Need help?</h1>
          </header>
          <p>This project is maintained by a dedicated group of people. They are always willing to help, but most of the time you'll find the answer to your question in our existing documentation, so please look there first.</p>
          <GridBlock contents={supportLinks} layout="threeColumn" />
        </div>
      </Container>
    </div>
  );
}

module.exports = Help;
