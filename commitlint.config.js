module.exports = {
    extends: ['@commitlint/config-conventional'],
    parserPreset: {
        parserOpts: {
            headerPattern: /^\[([^\]]+)\]\s(\w*)(?:\(([\w\$\.\-\* ]*)\))?:\s(.*)$/,
            headerCorrespondence: ['references', 'type', 'scope', 'subject'],
        },
    },
    rules: {
        'type-enum': [
            2,
            'always',
            [
                'feat',
                'fix',
                'docs',
                'style',
                'refactor',
                'perf',
                'test',
                'chore',
                'ci',
                'revert',
            ],
        ],
        'subject-case': [2, 'never', ['sentence-case', 'start-case', 'pascal-case', 'upper-case']],
    },
};
