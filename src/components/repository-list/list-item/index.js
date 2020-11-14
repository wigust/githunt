import React from 'react';
import PropTypes from 'prop-types';
import GithubColors  from 'github-colors';

import './styles.css';
import moment from 'moment';
import Star from '../../icons/star';
import Fork from '../../icons/fork';
import Issue from "../../icons/issue";

class ListItem extends React.Component {
  render() {
    const languageColor = GithubColors.get(this.props.repository.language);

    return (
      <div className="col-12 list-item-container">
        <div className="list-item-body">
            {
              this.props.repository.language && (
                <span className="d-inline-flex align-items-center mr-3">
                  <span className="repo-language-color" style={{
                    backgroundColor: languageColor ? languageColor.color : '#e8e8e8'
                  }}></span>
                  <span itemProp="programmingLanguage">
                    { this.props.repository.language }
                  </span>
                </span>
              )
            }
            <a className="muted-link d-inline-block mr-3"
               href={ `${this.props.repository.html_url}/stargazers` }
               rel="noopener noreferrer"
               target="_blank">
              <Star />
              &nbsp;
              { this.props.repository.stargazers_count.toLocaleString() }
            </a>
            <a className="muted-link d-inline-block mr-3"
               href={ `${this.props.repository.html_url}/network/members` }
               rel="noopener noreferrer"
               target="_blank">
              <Fork />
              &nbsp;
              { this.props.repository.forks ? this.props.repository.forks.toLocaleString() : 0 }
            </a>
            <a className="muted-link d-inline-block mr-3"
               href={ `${this.props.repository.html_url}/issues` }
               rel="noopener noreferrer"
               target="_blank">
              <Issue />
              &nbsp;
              { this.props.repository.open_issues ? this.props.repository.open_issues.toLocaleString() : 0 }
            </a>
              <a href={ this.props.repository.html_url } rel="noopener noreferrer" target="_blank">
                <span className="text-normal">{ this.props.repository.owner.login } / </span>
                { this.props.repository.name }
              </a>
            &nbsp;
            { this.props.repository.description || 'No description given.' }
        </div>
      </div>
    );
  }
}

ListItem.propTypes = {
  repository: PropTypes.object.isRequired
};

export default ListItem;
