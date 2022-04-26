import React from 'react';
import { Remarkable } from 'remarkable';


export class MarkdownBlock extends React.Component {

  getRawMarkup(markdown) {
    var md = new Remarkable();
    return { __html: md.render(markdown) };
  }

  render() {
    return (
      <div
        className="content"
        dangerouslySetInnerHTML={this.getRawMarkup(this.props.children)}
      />
    );
  }
}

export class Container extends React.Component {
  render() {
    return (
      <div className="container">
        empty
      </div>
    );
  }
}
export class GridBlock extends React.Component {

  array_chunk(arr, size){
    var i,
    j = arr.length,
    tempArray = [];
    for (i=0; i<j; i+=size) {
        tempArray.push(arr.slice(i,i+size));
    }
    return tempArray
  }

  renderBlockTitle(title) {
    if (!title) {
      return null;
    }

    return (
      <h2>{title}</h2>
    );
  }

  renderBlock(block) {

    return (
        <div key={block.title} className="col col--4">
          {this.renderBlockTitle(block.title)}
          <MarkdownBlock>{block.content}</MarkdownBlock>
        </div>
    );
  }

  renderRow(block) {
    return (
      <div className='row' key={block[0].title}>
          {this.renderBlock(block[0])}
          {this.renderBlock(block[1])}
          {this.renderBlock(block[2])}
        </div>
    );
  }

  render() {
    const chuckSize = 3;
    const chunks = this.array_chunk(this.props.contents, chuckSize);

    return (
      <div className="container">
        {chunks.map(this.renderRow, this)}
      </div>
    );
  }
};