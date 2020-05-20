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
  { caption: 'Soundcloud Logo',
    image: '/img/users/soundcloud%20%281%29.png',
    pinned: true
  },
  { caption: 'Accenture Logo',
    image: '/img/users/accenture (1).png'
  },
  { caption: 'The Iconic Logo',
    image: '/img/users/the-iconic%20%281%29.png'
  },
  { caption: 'Sainsburys Logo',
    image: '/img/users/sainsburys%20%281%29.png',
    pinned: true
  },
  { caption: 'Dun and Bradstreet Logo',
    image: '/img/users/dnb%20%281%29.png'
  },
  { caption: 'IBM Logo',
    image: '/img/users/ibm.jpg',
    pinned: true
  },
  { caption: 'Shutterstock Logo',
    image: '/img/users/shutterstock%20%281%29.png'
  },
  { caption: 'MessageMedia Logo',
    image: '/img/users/messagemedia.jpg'
  },
  { caption: 'NTT Data Logo',
    image: '/img/users/ntt-data.jpg'
  },
  { caption: 'Pivotal Labs Logo',
    image: '/img/users/pivotal-labs.png'
  },
  { caption: 'Portbase Logo',
    image: '/img/users/portbase.png'
  },
  { caption: 'RedHat Logo',
    image: '/img/users/redhat%20%281%29.png',
    pinned: true
  },
  { caption: 'Ratesetter Logo',
    image: '/img/users/ratesetter%20%281%29.png'
  },
  { caption: 'Aqovia Logo',
    image: '/img/users/aqovia.png'
  },
  { caption: 'Carsales Logo',
    image: '/img/users/carsales.png'
  },
  { caption: 'SEEK Jobs Logo',
    image: '/img/users/seek.jpg'
  },
  { caption: 'DiUS Logo',
    image: '/img/users/dius%20%281%29.png'
  },
  { caption: 'Arquillian Project Logo',
    image: '/img/users/arquillian.png'
  },
  { caption: 'lastminute.com',
    image: '/img/users/lastminute.png'
  },
  { caption: 'Cloudhealth Tech',
    image: '/img/users/cloudhealth-tech%20%281%29.png'
  },
  { caption: 'Repairly',
    image: '/img/users/repairly%20%281%29.png'
  },
  { caption: 'https://www.rapid7.com/',
    image: '/img/users/rapid7%20%281%29.png'
  },
  { caption: 'ASOS',
    image: '/img/users/asos%20%281%29.png',
    pinned: true
  },
  { caption: 'Simple',
    image: '/img/users/simplehq.png'
  },
  { caption: 'ITHAKA Logo',
    image: '/img/users/ithaka.png'
  },
  { caption: 'rightmove',
    image: '/img/users/rightmove-logo.png'
  },
  { caption: 'treatwell',
    image: '/img/users/treatwell-logo.png'
  },
  { caption: 'Novatec Consulting Logo',
    image: '/img/users/novatec.jpg'
  },
  { caption: 'JABLOTRON CLOUD Services Logo',
    image: '/img/users/jablotron-cloud-services.png'
  },

];

const siteConfig = {
  title: 'Pact', // Title for your website.
  tagline: 'Test your integrations quickly. Deploy your apps safely.',
  url: 'https://inspiring-panini-26eb5e.netlify.app', // Your website URL
  baseUrl: '/', // Base URL for your project */
  // For github.io type URLs, you would set the url and baseUrl like:
  //   url: 'https://facebook.github.io',
  //   baseUrl: '/test-site/',

  // Used for publishing and more
  projectName: 'pact-docs',
  organizationName: 'Pact Foundation',
  // For top-level user or org sites, the organization is still the same.
  // e.g., for the https://JoelMarcey.github.io site, it would be set like...
  //   organizationName: 'JoelMarcey'

  // For no header links in the top nav bar -> headerLinks: [],
  headerLinks: [
    {doc: 'README', label: 'Docs'},
    {doc: 'doc4', label: 'API'},
    {page: 'help', label: 'Help'},
    {blog: true, label: 'Blog'},
  ],

  // If you have users set above, you add it here:
  users,

  /* path to images for header/footer */
  headerIcon: 'img/favicon.ico',
  footerIcon: 'img/favicon.ico',
  favicon: 'img/favicon.ico',

  /* Colors for website */
  colors: {
    primaryColor: 'grey',
    secondaryColor: '#040972',
  },

  /* Custom fonts for website */
  /*
  fonts: {
    myFont: [
      "Times New Roman",
      "Serif"
    ],
    myOtherFont: [
      "-apple-system",
      "system-ui"
    ]
  },
  */

  // This copyright info is used in /core/Footer.js and blog RSS/Atom feeds.
  copyright: `Copyright © ${new Date().getFullYear()} Pact Foundation`,

  highlight: {
    // Highlight.js theme to use for syntax highlighting in code blocks.
    theme: 'default',
  },

  // Add custom scripts here that would be placed in <script> tags.
  scripts: ['https://buttons.github.io/buttons.js'],

  // On page navigation for the current documentation page.
  onPageNav: 'separate',
  // No .html extensions for paths.
  cleanUrl: true,

  // Open Graph and Twitter card images.
  ogImage: 'img/undraw_online.svg',
  twitterImage: 'img/undraw_tweetstorm.svg',

  // For sites with a sizable amount of content, set collapsible to true.
  // Expand/collapse the links and subcategories under categories.
  docsSideNavCollapsible: true,

  // Show documentation's last contributor's name.
  enableUpdateBy: true,

  // Show documentation's last update time.
  enableUpdateTime: true,

  // You may provide arbitrary config keys to be used as needed by your
  // template. For example, if you need your repo's URL...
  repoUrl: 'https://github.com/pact-foundation/docs.pact.io',

  editUrl: 'https://github.com/pact-foundation/docs.pact.io/blob/master/docs/',
  docsUrl: '',

  twitterUsername: '@pact_up'
};

module.exports = siteConfig;
