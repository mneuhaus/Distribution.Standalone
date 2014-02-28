# Expose Distribution without Neos

## Installation

```
composer create-project -s dev famelo/standalone standalone
cd standalone
beard patch
```

**beard** is a little helper to automatically patch based on gerrit
changes specified in gerrit.json. (https://github.com/mneuhaus/Beard)

Then you can go to to http://[standalone-domain]/setup to set up your database configuration
