import { defineConfig, normalizePath } from 'vite';
import laravel from 'laravel-vite-plugin';
import path from 'path';
import { viteStaticCopy } from 'vite-plugin-static-copy';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
        viteStaticCopy({
            targets: [
                {
                    src: normalizePath(path.join(__dirname, '/resources/img/**/*')),
                    dest: normalizePath(path.join(__dirname, '/public/img'))
                },
            ],
        }),
    ],
});
