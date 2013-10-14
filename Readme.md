# Expose Distribution without Neos

## Installation

```
git clone https://github.com/mneuhaus/Distribution.Standalone.git Standalone
cd Standalone
git checkout refactor_processors
composer update
beard patch
```

Then you can go to to http://[standalone-domain]/setup to set up your database configuration

**beard patch**

this is a command to apply patches specified in gerrit.json you can find this tool here:
https://github.com/mneuhaus/Beard
