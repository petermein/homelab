module.exports = {
        "platform": "github",
        "token": "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",
        "logFileLevel": "trace",
        "onboarding": false,
        "allowCustomCrateRegistries": true,
        "allowScripts": true,
        "exposeAllEnv": true,
        "dryRun": "full",
        "gitAuthor": "Renovate Bot <bot@renovateapp.com>",
        "repositories": ["petermein/homelab"],
        "includeForks": true,
        "hostRules": [
            {
              hostType: 'docker',
              username: 'petermein',
              password: process.env.DOCKER_HUB_PASSWORD,
            },
          ],
        "regexManagers": [
          {
            "fileMatch": ["^\\.github/workflows/[^/]+\\.ya?ml$"],
            "matchStrings": ["uses: (?<depName>.*?)@(?<currentValue>.*?)\\s"],
            "datasourceTemplate": "github-tags"
          }
        ]
      }
