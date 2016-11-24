let project = new Project('slices');
project.addAssets('Assets/**');
//project.addLibrary('kha-textureatlas-extension'); // optional
project.addSources('..');
project.addSources('src');
resolve(project);
