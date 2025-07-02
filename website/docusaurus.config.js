/**
 * Copyright (c) 2017-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// See https://docusaurus.io/docs/site-config for all the possible
// site configuration options.

// List of projects/orgs using your project for the users page.
const users = [
  // {
  //   caption: 'User1',
  //   // You will need to prepend the image path with your baseUrl
  //   // if it is not '/', like: '/test-site/img/image.jpg'.
  //   image: '/img/undraw_open_source.svg',
  //   infoLink: 'https://www.facebook.com',
  //   pinned: true,
  // },
  {
    caption: 'Soundcloud Logo',
    image: '/img/users/soundcloud.png',
    pinned: true
  },
  { caption: 'Accenture Logo', image: '/img/users/accenture.png' },
  { caption: 'The Iconic Logo', image: '/img/users/the-iconic.png' },
  {
    caption: 'Sainsburys Logo',
    image: '/img/users/sainsburys.png',
    pinned: true
  },
  { caption: 'Dun and Bradstreet Logo', image: '/img/users/dnb.png' },
  { caption: 'IBM Logo', image: '/img/users/ibm.jpg', pinned: true },
  { caption: 'Shutterstock Logo', image: '/img/users/shutterstock.png' },
  { caption: 'MessageMedia Logo', image: '/img/users/messagemedia.jpg' },
  { caption: 'NTT Data Logo', image: '/img/users/ntt-data.jpg' },
  { caption: 'Pivotal Labs Logo', image: '/img/users/pivotal-labs.png' },
  { caption: 'Portbase Logo', image: '/img/users/portbase.png' },
  { caption: 'RedHat Logo', image: '/img/users/redhat.png', pinned: true },
  { caption: 'Ratesetter Logo', image: '/img/users/ratesetter.png' },
  { caption: 'Aqovia Logo', image: '/img/users/aqovia.png' },
  { caption: 'Carsales Logo', image: '/img/users/carsales.png' },
  { caption: 'SEEK Jobs Logo', image: '/img/users/seek.jpg' },
  { caption: 'DiUS Logo', image: '/img/users/dius.png' },
  { caption: 'Arquillian Project Logo', image: '/img/users/arquillian.png' },
  { caption: 'lastminute.com', image: '/img/users/lastminute.png' },
  { caption: 'Cloudhealth Tech', image: '/img/users/cloudhealth-tech.png' },
  { caption: 'Repairly', image: '/img/users/repairly.png' },
  { caption: 'https://www.rapid7.com/', image: '/img/users/rapid7.png' },
  { caption: 'ASOS', image: '/img/users/asos.png', pinned: true },
  { caption: 'Simple', image: '/img/users/simplehq.png' },
  { caption: 'ITHAKA Logo', image: '/img/users/ithaka.png' },
  { caption: 'rightmove', image: '/img/users/rightmove-logo.png' },
  {
    caption: 'treatwell',
    image: '/img/users/treatwell-logo.png',
    pinned: true
  },
  { caption: 'Novatec Consulting Logo', image: '/img/users/novatec.jpg' },
  {
    caption: 'JABLOTRON CLOUD Services Logo',
    image: '/img/users/jablotron-cloud-services.png'
  }
];

const siteConfig = {
  title: 'Pact Docs', // Title for your website.
  tagline: 'Test your integrations quickly. Deploy your apps safely.',
  url: 'https://docs.pact.io', // Your website URL
  baseUrl: '/',
  onBrokenLinks: 'throw', // Fail the build on broken links
  customFields: {
    users: users
  },
  // Used for publishing and more
  projectName: 'pact-docs',
  organizationName: 'Pact Foundation',

  themeConfig: {
    announcementBar: {
      id: 'announcement-bar',
      content: '<div id="announcement-bar">🚀 AI Automation is Here! Simplify Contract Testing with PactFlow. <a target="_blank" href="https://pactflow.io/ai/?utm_source=docs.pact.io&utm_medium=web&utm_campaign=ai-beta&utm_content=banner">Sign Up Now >></a>.</div>',
      backgroundColor: '#454CF0',
      textColor: '#fff',
      isCloseable: false,
    },
    custom: './src/css/how-pact-works',

    algolia: {
      appId: '6CMS0LVNYE',
      apiKey: '9d560a8ae18f8a304605caf0130e9874',
      indexName: 'pact'
    },

    metadata: [
      { name: 'docsearch:docusaurus_tag', content: 'docs-default-current' }
    ],

    navbar: {
      title: 'Pact',
      logo: {
        alt: 'Docusaurus Logo',
        src: 'img/favicon.ico'
      },
      items: [
        { to: '/', label: 'Getting Started', position: 'left' },
        { to: 'consumer', label: 'Guides', position: 'left' },
        {
          to: 'implementation_guides/overview',
          label: 'Pact Docs',
          position: 'left'
        },
        {
          to: 'pact_broker/docker_images',
          label: 'Pact Broker Docs',
          position: 'left'
        },
        { to: 'history', label: 'Resources', position: 'left' },
        { to: 'contributing', label: 'Contributing', position: 'left' },
        { to: 'blog', label: 'Blog', position: 'left' },
        { to: 'help', label: 'Help', position: 'left' },
        { to: 'university', label: 'University', position: 'left' }
      ]
    },

    footer: {
      logo: {
        alt: 'Pact Foundation logo',
        src: 'img/favicon.ico',
        href: 'https://docs.pact.io/'
      },
      copyright: `Copyright © ${new Date().getFullYear()} Pact Foundation`,
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Getting Started',
              to: '/'
            },
            {
              label: 'Guides',
              to: 'consumer'
            },
            {
              label: 'Pact Docs',
              to: 'implementation_guides/cli'
            },
            {
              label: 'Resources',
              to: 'history'
            },
            {
              label: 'Help',
              to: 'help'
            }
          ]
        },
        {
          title: 'Community',
          items: [
            {
              label: 'Stack Overflow',
              href: 'https://stackoverflow.com/questions/tagged/pact'
            },
            {
              label: 'Join Slack',
              href: 'https://slack.pact.io'
            },
            {
              label: 'Twitter',
              href: 'https://twitter.com/pact_up'
            }
          ]
        },
        {
          title: 'More',
          items: [
            {
              label: 'Blog',
              href: 'https://docs.pact.io/blog'
            },
            {
              label: 'GitHub',
              href: 'https://github.com/pact-foundation'
            }
          ]
        }
      ]
    },
    image: 'img/docusaurus.png',

    // Open Graph and Twitter card images.
    ogImage: 'img/undraw_online.svg',
    twitterImage: 'img/undraw_tweetstorm.svg',

    prism: {
      additionalLanguages: [
        'ruby',
        'rust',
        'csharp',
        'java',
        'powershell',
        'docker',
        'groovy',
        'scala',
        'erlang',
        'php',
        'go'
      ]
    },

    // https://docusaurus.io/docs/next/markdown-features/diagrams#theming
    mermaid: {
      theme: {light: 'neutral', dark: 'dark'},
      options: {
        useMaxWidth: true,
      },
    },
    // ...
  },

  /* path to images for header/footer */
  favicon: 'img/favicon.ico',

  trailingSlash: false,

  // This copyright info is used in /core/Footer.js and blog RSS/Atom feeds.

  // highlight: {
  //   // Highlight.js theme to use for syntax highlighting in code blocks.
  //   theme: 'default',
  // },

  // Add custom scripts here that would be placed in <script> tags.
  scripts: ['https://buttons.github.io/buttons.js'],

  // On page navigation for the current documentation page.
  // onPageNav: 'separate',
  
  // https://docusaurus.io/docs/next/markdown-features/diagrams
  markdown: {
    mermaid: true,
  },
  themes: ['@docusaurus/theme-mermaid'],
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          path: 'docs/',
          editUrl:
            'https://github.com/pact-foundation/docs.pact.io/edit/master/website/',

          sidebarPath: require.resolve('./sidebars.json'),
          showLastUpdateAuthor: true,
          // Equivalent to `enableUpdateTime`.
          showLastUpdateTime: true,
          routeBasePath: '/',

          // You may provide arbitrary config keys to be used as needed by your
          // template. For example, if you need your repo's URL...
          // repoUrl: 'https://github.com/pact-foundation/docs.pact.io',
          // Equivalent to `docsSideNavCollapsible`.
          sidebarCollapsible: true
        },
        googleTagManager: {
          containerId: 'GTM-PFFSBW3',
        },
        theme: {
          customCss: [require.resolve('./src/css/custom.css')]
        },
        blog: {
          blogSidebarTitle: 'All posts',
          blogSidebarCount: 'ALL'
        }
      }
    ]
  ]
};

module.exports = siteConfig;
