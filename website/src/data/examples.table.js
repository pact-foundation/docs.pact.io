import React from 'react';

export const tableData = [
  {
    linkTitle:
      'React JavaScript Website tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/js/consumer',
    badges: [
      'https://testdemo.pactflow.io/pacts/provider/pactflow-example-provider/consumer/pactflow-example-consumer/latest/badge.svg'
    ],
    language: 'JavaScript',
    useCase: 'Web',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'React JavaScript Website tested using Cypress to generate consumer pacts',
    linkUrl: '/docs/examples/cypress',
    badges: [
      'https://testdemo.pactflow.io/pacts/provider/pactflow-example-provider/consumer/example-consumer-cypress/latest/badge.svg'
    ],
    language: 'JavaScript',
    useCase: 'Web',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS API provider tested with Pact Verifier',
    linkUrl: '/docs/examples/js/provider',
    badges: [
      'https://testdemo.pactflow.io/pacts/provider/pactflow-example-provider/consumer/pactflow-example-consumer/latest/badge.svg',
      'https://testdemo.pactflow.io/pacts/provider/pactflow-example-provider/consumer/example-consumer-cypress/latest/badge.svg'
    ],
    language: 'JavaScript',
    useCase: 'API',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Consumer Cypress',
        link: '/docs/examples/cypress/'
      },
      {
        name: 'Example Consumer',
        link: '/docs/examples/js/consumer'
      }
    ]
  },
  {
    linkTitle:
      '.NET API Provider tested wtih Swashbuckle and Schemathesis against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/dotnet',
    badges: [],
    language: '.NET',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer .NET',
        link: '/docs/examples/bi-directional/provider/dotnet/'
      }
    ]
  },
  {
    linkTitle: 'SpringBoot API Provider tested with RestAssured against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/restassured',
    badges: [],
    language: 'Java',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer Cypress',
        link: '/docs/examples/bi-directional/consumer/cypress/'
      },
      {
        name: 'Example Bi-Directional Consumer Mountebank',
        link: '/docs/examples/bi-directional/consumer/mountebank/'
      },
      {
        name: 'Example Bi-Directional Consumer Wiremock',
        link: '/docs/examples/bi-directional/consumer/wiremock/'
      },
      {
        name: 'Example Bi-Directional Consumer Nock',
        link: '/docs/examples/bi-directional/consumer/nock/'
      },
      {
        name: 'Example Bi-Directional Consumer MSW',
        link: '/docs/examples/bi-directional/consumer/msw/'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS API Provider tested with Postman against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/postman',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer Cypress',
        link: '/docs/examples/bi-directional/consumer/cypress/'
      },
      {
        name: 'Example Bi-Directional Consumer Mountebank',
        link: '/docs/examples/bi-directional/consumer/mountebank/'
      },
      {
        name: 'Example Bi-Directional Consumer Wiremock',
        link: '/docs/examples/bi-directional/consumer/wiremock/'
      },
      {
        name: 'Example Bi-Directional Consumer Nock',
        link: '/docs/examples/bi-directional/consumer/nock/'
      },
      {
        name: 'Example Bi-Directional Consumer MSW',
        link: '/docs/examples/bi-directional/consumer/msw/'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS API Provider tested with ReadyAPI against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/readyapi',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer Cypress',
        link: '/docs/examples/bi-directional/consumer/cypress/'
      },
      {
        name: 'Example Bi-Directional Consumer Mountebank',
        link: '/docs/examples/bi-directional/consumer/mountebank/'
      },
      {
        name: 'Example Bi-Directional Consumer Wiremock',
        link: '/docs/examples/bi-directional/consumer/wiremock/'
      },
      {
        name: 'Example Bi-Directional Consumer Nock',
        link: '/docs/examples/bi-directional/consumer/nock/'
      },
      {
        name: 'Example Bi-Directional Consumer MSW',
        link: '/docs/examples/bi-directional/consumer/msw/'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS API Provider tested with SoapUI against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/soapui',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer Cypress',
        link: '/docs/examples/bi-directional/consumer/cypress/'
      },
      {
        name: 'Example Bi-Directional Consumer Mountebank',
        link: '/docs/examples/bi-directional/consumer/mountebank/'
      },
      {
        name: 'Example Bi-Directional Consumer Wiremock',
        link: '/docs/examples/bi-directional/consumer/wiremock/'
      },
      {
        name: 'Example Bi-Directional Consumer Nock',
        link: '/docs/examples/bi-directional/consumer/nock/'
      },
      {
        name: 'Example Bi-Directional Consumer MSW',
        link: '/docs/examples/bi-directional/consumer/msw/'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS API Provider tested with Dredd against OAS',
    linkUrl: '/docs/examples/bi-directional/provider/dredd',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Consumer Cypress',
        link: '/docs/examples/bi-directional/consumer/cypress/'
      },
      {
        name: 'Example Bi-Directional Consumer Mountebank',
        link: '/docs/examples/bi-directional/consumer/mountebank/'
      },
      {
        name: 'Example Bi-Directional Consumer Wiremock',
        link: '/docs/examples/bi-directional/consumer/wiremock/'
      },
      {
        name: 'Example Bi-Directional Consumer Nock',
        link: '/docs/examples/bi-directional/consumer/nock/'
      },
      {
        name: 'Example Bi-Directional Consumer MSW',
        link: '/docs/examples/bi-directional/consumer/msw/'
      }
    ]
  },
  {
    linkTitle: 'Python API Provider tested with Pact Verifier',
    linkUrl: '/docs/examples/provider/python',
    badges: [],
    language: 'Python',
    useCase: 'API',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Python Consumer',
        link: '/docs/examples/python/consumer/'
      }
    ]
  },
  {
    linkTitle: 'Golang Gin API Provider tested with Pact Verifier',
    linkUrl: '/docs/examples/golang/python',
    badges: [],
    language: 'Golang',
    useCase: 'API',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Golang Consumer',
        link: '/docs/examples/golang/consumer/'
      }
    ]
  },
  {
    linkTitle: '.NET API Provider tested with Pact Verifier',
    linkUrl: '/docs/examples/dotnet/python',
    badges: [],
    language: '.NET',
    useCase: 'API',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example .NET Consumer',
        link: '/docs/examples/dotnet/consumer/'
      }
    ]
  },
  {
    linkTitle: 'Java SOAP API provider tested with Pact Verifier',
    linkUrl: '/docs/examples/soap/java/provider',
    badges: [],
    language: 'Java',
    useCase: 'SOAP',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Java XML Consumer',
        link: '/docs/examples/soap/java/consumer/'
      }
    ]
  },
  {
    linkTitle: 'Java Kafka message provider tested with Pact Verifier',
    linkUrl: '/docs/examples/kafka/java/provider',
    badges: [],
    language: 'Java',
    useCase: 'Messages',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Java Kafka Consumer',
        link: '/docs/examples/kafka/java/consumer/'
      },
      {
        name: 'Example NodeJS Kafka Consumer',
        link: '/docs/examples/kafka/js/consumer/'
      }
    ]
  },
  {
    linkTitle: 'Java Spring Boot API provider tested with Pact Verifier',
    linkUrl: '/docs/examples/java/provider-springboot',
    badges: [],
    language: 'Java',
    useCase: 'API',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Java Junit Consumer',
        link: '/docs/examples/java/consumer/junit/'
      }
    ]
  },
  {
    linkTitle: 'ExpressJS AWS Lambda SNS Provider tested with Pact Verifier',
    linkUrl: '/docs/examples/aws/sns/provider',
    badges: [],
    language: 'JavaScript',
    useCase: 'Messages',
    side: 'Provider',
    compatible_clients: [
      {
        name: 'Example Node AWS SNS Consumer',
        link: '/docs/examples/aws/sns/consumer//docs/examples/aws/sns/consumer/'
      }
    ]
  },
  {
    linkTitle:
      'Node API consumer using Mountebank stubs and Pact Bi-Directional BYO adapters to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/mountebank',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'Java API consumer using Wiremock stubs and Pact Bi-Directional BYO adapters to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/wiremock',
    badges: [],
    language: 'Java',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'React JavaScript Website using MSW mocks and pact-msw-adapter to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/msw',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'React JavaScript Website using Playwright routes and custom pact adapter to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/playwright_js',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'React JavaScript Website using Cypress fixtures and pact-cypress-adapter to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/cypress',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },
  {
    linkTitle:
      'React JavaScript Website using Nock Record & Replay feature and pact-nock-adapter to generate Pact contracts',
    linkUrl: '/docs/examples/bi-directional/consumer/recordreplay',
    badges: [],
    language: 'JavaScript',
    useCase: 'OpenAPI',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider Dredd',
        link: '/docs/examples/bi-directional/provider/dredd/'
      },
      {
        name: 'Example Bi-Directional Provider Postman',
        link: '/docs/examples/bi-directional/provider/postman/'
      },
      {
        name: 'Example Bi-Directional Provider RestAssured',
        link: '/docs/examples/bi-directional/provider/restassured/'
      },
      {
        name: 'Example Provider',
        link: '/docs/examples/js/provider'
      }
    ]
  },

  {
    linkTitle:
      'Python API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/python/consumer',
    badges: [],
    language: 'Python',
    useCase: 'API',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Python Provider',
        link: '/docs/examples/python/provider/'
      }
    ]
  },
  {
    linkTitle:
      'Golang API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/golang/consumer',
    badges: [],
    language: 'Golang',
    useCase: 'API',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Golang Provider',
        link: '/docs/examples/golang/provider/'
      }
    ]
  },
  {
    linkTitle:
      '.NET (v3.x.x) API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/dotnet/consumer',
    badges: [],
    language: '.NET',
    useCase: 'API',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Provider .NET',
        link: '/docs/examples/dotnet/provider/'
      }
    ]
  },
  {
    linkTitle:
      '.NET (v4.x.x) API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/bi-directional/consumer/dotnet',
    badges: [],
    language: '.NET',
    useCase: 'API',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Bi-Directional Provider .NET',
        link: '/docs/examples/bi-directional/consumer/dotnet/'
      }
    ]
  },
  {
    linkTitle:
      'Java Junit API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/java/consumer/junit',
    badges: [],
    language: 'Java',
    useCase: 'API',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Java Spring Boot Provider',
        link: '/docs/examples/java/provider-springboot/'
      }
    ]
  },
  {
    linkTitle:
      'Java SOAP API Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/soap/java/consumer',
    badges: [],
    language: 'Java',
    useCase: 'SOAP',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Java XML Provider',
        link: '/docs/examples/soap/java/provider'
      }
    ]
  },
  {
    linkTitle:
      'Java Kafka Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/kafka/java/consumer',
    badges: [],
    language: 'Java',
    useCase: 'Messages',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Java Kafka Producer',
        link: '/docs/examples/kafka/java/provider'
      }
    ]
  },
  {
    linkTitle:
      'NodeJS Kafka Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/kafka/js/consumer',
    badges: [],
    language: 'NodeJS',
    useCase: 'Messages',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example Java Kafka Producer',
        link: '/docs/examples/kafka/java/provider'
      }
    ]
  },
  {
    linkTitle:
      'NodeJS AWS Lambda SNS Consumer tested using Pact to generate consumer pacts',
    linkUrl: '/docs/examples/aws/sns/consumer',
    badges: [],
    language: 'NodeJS',
    useCase: 'Messages',
    side: 'Consumer',
    compatible_clients: [
      {
        name: 'Example NodeJS SNS Provider',
        link: '/docs/examples/aws/sns/provider/'
      }
    ]
  }
];

export const columns = [
  {
    Header: 'Language',
    accessor: 'language',
    className: 'data-table'
  },
  {
    Header: 'Type',
    accessor: 'side',
    className: 'data-table'
  },
  {
    Header: 'Use Case',
    accessor: 'useCase',
    className: 'data-table'
  },
  {
    Header: 'Demo',
    accessor: 'linkTitle',
    className: 'data-table left',
    Cell: ({ cell: { value }, row: { original } }) => (
      <a href={`${original.linkUrl}`} rel="noreferrer noopener">
        {value}
      </a>
    )
  },
  // {
  //   Header: "Contracts",
  //   accessor: "badges",
  //   className: "data-table",
  //   Cell: ({ row: { original } }) => {
  //     const badges = original.badges;
  //     if (!badges) return "";
  //     return badges.map((w) => (
  //       <a href={w.replace("/badge.svg", "")}>
  //         {" "}
  //         <img src={w}/>
  //       </a>
  //     ));
  //   },
  // },
  {
    Header: 'Compatible With',
    accessor: 'compatible_clients',
    className: 'data-table',
    Cell: ({ row: { original } }) => {
      const compatible_clients = original.compatible_clients;
      if (!compatible_clients) return '';
      return compatible_clients.map((w) => (
        <li key={w.link + original.linkTitle + Math.random()}>
          <a href={w.link}>{w.name}</a>
        </li>
      ));
    }
  }
];
