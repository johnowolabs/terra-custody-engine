;; synthetic-earth-catalog

;; ===== System Response Code Definitions =====

;; Operation failure response codes for network interactions  
(define-constant territory-lookup-failed (err u401))
(define-constant territory-already-registered (err u402))
(define-constant metadata-validation-failed (err u403))
(define-constant size-parameter-invalid (err u404))
(define-constant authentication-rejected (err u405))
(define-constant ownership-verification-failed (err u406))
(define-constant admin-privilege-required (err u400))
(define-constant access-restrictions-violated (err u407))
(define-constant parameter-validation-error (err u408))

;; Protocol Administrator Principal Address
(define-constant protocol-administrator tx-sender)

;; ===== Core Registry Data Structures =====

;; Territory Information Storage - Primary biomass sector records
(define-map biomass-territories
  { territory-index: uint }
  {
    territory-label: (string-ascii 64),
    proprietor-address: principal,
    territory-area: uint,
    registration-height: uint,
    soil-characteristics: (string-ascii 128),
    cultivation-species: (list 10 (string-ascii 32))
  }
)

;; Viewer Permission Management - Controls territory visibility
(define-map territory-viewing-rights
  { territory-index: uint, viewer-address: principal }
  { viewing-authorized: bool }
)

;; Global Registry Statistics Counter
(define-data-var registered-territories uint u0)

;; ===== Primary Registry Functions =====

;; Function: Register new biomass territory with comprehensive metadata