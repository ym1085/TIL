#!/bin/bash

git switch master && git merge docs && git push origin master && git switch docs && git push origin docs