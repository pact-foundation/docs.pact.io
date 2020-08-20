/**
 * Copyright (c) 2017-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import React from 'react';
import Layout from '@theme/Layout';

import { MarkdownBlock } from '../components/compLibraryV2.js';

class Users extends React.Component {
  render() {
    const { config: siteConfig } = this.props;
    const users = siteConfig.customFields.users;

    if ((users || []).length === 0) {
      return (<Layout>
        <div>Users not found</div>
      </Layout>)
    }

    const editUrl = `${siteConfig.repoUrl}/edit/master/website/docusaurus.config.js`;
    const showcase = users.map(user => (
      <a href={user.infoLink} key={user.caption}>
        <img src={user.image} alt={user.caption} title={user.caption} />
      </a>
    ));

    return (
      <Layout>
        <div className="mainContainer container">
          <div padding={['bottom', 'top']}>
            <div className="showcaseSection">
              <div className="prose">
                <h1>Who is Using This?</h1>
                <p>This project is used by many folks</p>
              </div>
              <div className="logos">{showcase}</div>
              <p>Are you using this project?</p>
              <a href={editUrl} className="button">
                Add your company
              </a>
            </div>
          </div>
          <div padding={['bottom', 'top']}>
            <div className="showcaseSection">
              <MarkdownBlock>![ITV Logo](/img/itv-logo-for-white-backgrounds.png)</MarkdownBlock>
              <MarkdownBlock> > "In 2016, ITV fulfilled over a billion on-demand TV requests to our 17 million registered users across 27 platforms. Pact Consumer Driven Contract testing has become an essential tool in our development pipeline to ensure our various back end systems, APIs and third party clients smoothly integrate with each other. Using Pact we have eliminated the need for tightly coupled integration test environments in favour of isolated micro-services that can be tested and deployed independently, safe in the knowledge that they honor the functionality expected of their consumers."</MarkdownBlock>
              <MarkdownBlock> _Daniel Oades, Principal Developer In Test,_ [_ITV_](http://itv.com/)</MarkdownBlock>
            </div>
          </div>
          <div padding={['bottom', 'top']}>
            <div className="showcaseSection">
              <MarkdownBlock> ![Poppulo Logo](/img/poppulo.png)</MarkdownBlock>
              <MarkdownBlock> > "Poppulo's Internal Communications platform is used to reach more than 15 million employees around the world. When we transformed our architecture from monolith to microservices, Consumer-Driven Contracts helped us massively in testing service interactions across 100+ microservices, without relying on heavy \(and sometimes brittle\) full end-to-end environments. Pacts are also great conversation starters: they enabled better collaboration between teams, facilitating communications early on when designing and agreeing on new APIs."</MarkdownBlock>
              <MarkdownBlock> _Pierre - Infrastructure & Reliability Manager,_ [_Poppulo_](https://www.poppulo.com/)</MarkdownBlock>

            </div>
          </div>
        </div>

      </Layout>
    );
  }
}

export default Users;