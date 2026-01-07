#!/usr/bin/ucode
'use strict';

import { cursor } from 'uci';

const methods = {
	get_theme: {
		call: function() {
			const uci = cursor();
			uci.load('aurora');

			const theme = uci.get_all('aurora', 'theme') || {};

			const light = {};
			const dark = {};

			for (let key in theme) {
				if (key.startsWith('dark_')) {
					dark[key] = theme[key];
				} else {
					light[key] = theme[key];
				}
			}

			return {
				light: light,
				dark: dark,
				all: theme
			};
		}
	}
};

return { 'aurora': methods };
