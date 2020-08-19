import React from 'react';
import { Remarkable } from 'remarkable';

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

  getRawMarkup(markdown) {
    var md = new Remarkable();
    return { __html: md.render(markdown) };
  }

  renderBlock(block) {

    return (
        <div className="col col--4">
          {this.renderBlockTitle(block.title)}
          <div
              className="content"
              dangerouslySetInnerHTML={this.getRawMarkup(block.content)}
            />
        </div>
    );
  }

  renderRow(block, index) {
//  key={block.title}
    return (
      <div className='row'>
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
