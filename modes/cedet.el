;;; cedet.el -- config for cedet and semantic

;;; Commentary:

;;; Code:
;;; cedet and semantic
(require 'cedet)
(require 'semantic)
(require 'semantic/bovine/c)
(require 'semantic/bovine/gcc)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)
(semantic-add-system-include "~/usr/include/" 'c-mode)
(semantic-mode 1)
(global-ede-mode 1)
(ede-enable-generic-projects)

;;; cedet.el ends here
