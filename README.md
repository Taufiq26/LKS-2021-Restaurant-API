# LKS-2021-Restaurant-API
- Generate secure JWT_SECRET
```bash
php -r "echo 'JWT_SECRET='.bin2hex(random_bytes(32)).PHP_EOL;"
```
- Link the storage image path to public
```bash
mkdir -p storage/app/public/menu
chmod -R 775 storage
ln -s /full-path-to-project-code/storage/app/public /full-path-to-project-code/public/storage
```