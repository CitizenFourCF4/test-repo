from argparse import ArgumentParser

def parse_command_line_args():
    parser = ArgumentParser(
        description='Sends update data to telegram bot',
        usage='python main.py [--help] --pr_title=PR_TITLE --contributor_login=CONTRIBUTOR_LOGIN --merged_at=MERGED_AT --repo_name=REPO_NAME'
    )
    parser.add_argument(
        '--pr_title',
        type=str,
        help='What changes have taken place'
    )
    parser.add_argument(
        '--contributor_login',
        type=str,
        help='The user who made the change'
    )
    parser.add_argument(
        '--merged_at',
        type=str,
        help='The time at which the changes were applied'
    )
    parser.add_argument(
        '--repo_name',
        type=str,
        help='Repository that has changed'
    )
    arguments = parser.parse_args()
    pr_title = arguments.pr_title
    contributor_login = arguments.contributor_login
    time_of_applying_changes = arguments.merged_at
    repo_name = arguments.repo_name

    return pr_title, contributor_login, time_of_applying_changes, repo_name