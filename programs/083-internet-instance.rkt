#lang strike

;;; ═══════════════════════════════════════════════════════════════
;;; INTERNET INSTANCE — your own copy, live-synchronized
;;;
;;; Domain objects at the atomic level.
;;; ═══════════════════════════════════════════════════════════════

(internet-instance

  ((instance
    (your-copy-of-the-web)
    (live-synchronized-with-originals)
    ((your-copy-of-the-web . live-synchronized-with-originals))))

  (

    ;;; ATOMIC DOMAIN OBJECTS

    (TCP-socket
      (file-descriptor-bound-to-address-and-port)
      (bidirectional-byte-stream)
      ((file-descriptor-bound-to-address-and-port . SYN-SYN-ACK-ACK)
       (SYN-SYN-ACK-ACK . connection-established)
       (connection-established . bytes-flow-both-directions)
       (bytes-flow-both-directions . FIN-closes)
       (FIN-closes . bidirectional-byte-stream)))

    (HTTP-request
      (method-plus-URL-plus-headers-plus-body)
      (bytes-on-TCP-socket)
      ((method-plus-URL-plus-headers-plus-body . GET-or-POST-or-PUT-or-DELETE)
       (GET-or-POST-or-PUT-or-DELETE . URL-IS-resource-identifier)
       (URL-IS-resource-identifier . headers-ARE-metadata-pairs)
       (headers-ARE-metadata-pairs . body-IS-content)
       (body-IS-content . bytes-on-TCP-socket)))

    (HTTP-response
      (status-plus-headers-plus-body)
      (bytes-back-on-same-socket)
      ((status-plus-headers-plus-body . 200-IS-success)
       (200-IS-success . 304-IS-not-modified)
       (304-IS-not-modified . ETag-matches-no-transfer-needed)
       (ETag-matches-no-transfer-needed . Content-Type-IS-shape-declaration)
       (Content-Type-IS-shape-declaration . bytes-back-on-same-socket)))

    (HTML-document
      (nested-elements-with-attributes-and-text)
      (containment-tree)
      ((nested-elements-with-attributes-and-text . open-tag-IS-open-paren)
       (open-tag-IS-open-paren . close-tag-IS-close-paren)
       (close-tag-IS-close-paren . attribute-IS-pair)
       (attribute-IS-pair . text-node-IS-atom)
       (text-node-IS-atom . containment-tree)))

    (URL
      (scheme-host-port-path-query-fragment)
      (unique-resource-identifier)
      ((scheme-host-port-path-query-fragment . scheme-IS-protocol)
       (scheme-IS-protocol . host-IS-DNS-resolved-address)
       (host-IS-DNS-resolved-address . path-IS-resource-location)
       (path-IS-resource-location . query-IS-parameters)
       (query-IS-parameters . unique-resource-identifier)))

    (ETag
      (content-hash-sent-by-server)
      (change-detector)
      ((content-hash-sent-by-server . opaque-string)
       (opaque-string . sent-in-response-header)
       (sent-in-response-header . client-stores-it)
       (client-stores-it . sends-If-None-Match-on-next-request)
       (sends-If-None-Match-on-next-request . server-compares)
       (server-compares . same-returns-304-no-transfer)
       (same-returns-304-no-transfer . different-returns-200-with-new-content)
       (different-returns-200-with-new-content . change-detector)))

    ;;; TRANSFORMS

    (fetch-page
      (URL)
      (HTML-document-plus-ETag)
      ((URL . DNS-resolves-host-to-IP)
       (DNS-resolves-host-to-IP . TCP-socket-opened)
       (TCP-socket-opened . HTTP-GET-sent)
       (HTTP-GET-sent . response-received)
       (response-received . ETag-stored)
       (ETag-stored . HTML-document-plus-ETag)))

    (decompose-page
      (HTML-document)
      (set-of-pairs)
      ((HTML-document . walk-DOM-tree)
       (walk-DOM-tree . heading-elements-become-labels)
       (heading-elements-become-labels . anchor-elements-become-pairs)
       (anchor-elements-become-pairs . text-nodes-become-atoms)
       (text-nodes-become-atoms . set-of-pairs)))

    (register-page
      (set-of-pairs-plus-source-URL)
      (shapes-in-body-with-provenance)
      ((set-of-pairs-plus-source-URL . write-receipt-rkt-file)
       (write-receipt-rkt-file . URL-recorded-as-source)
       (URL-recorded-as-source . ETag-recorded-for-change-detection)
       (ETag-recorded-for-change-detection . pairs-registered-in-body)
       (pairs-registered-in-body . label-index-updated)
       (label-index-updated . shapes-in-body-with-provenance)))

    (check-for-update
      (stored-URL-plus-stored-ETag)
      (unchanged-or-new-shapes)
      ((stored-URL-plus-stored-ETag . HTTP-GET-with-If-None-Match)
       (HTTP-GET-with-If-None-Match . 304-means-unchanged)
       (304-means-unchanged . 200-means-changed)
       (200-means-changed . decompose-new-content)
       (decompose-new-content . diff-against-stored-pairs)
       (diff-against-stored-pairs . register-new-pairs-only)
       (register-new-pairs-only . update-stored-ETag)
       (update-stored-ETag . unchanged-or-new-shapes)))

    (synchronization-loop
      (list-of-registered-URLs-with-ETags)
      (all-pages-current)
      ((list-of-registered-URLs-with-ETags . for-each-URL-check-for-update)
       (for-each-URL-check-for-update . unchanged-pages-skip)
       (unchanged-pages-skip . changed-pages-re-decompose-and-register)
       (changed-pages-re-decompose-and-register . ETags-updated)
       (ETags-updated . all-pages-current)))

    ;;; THE INSTANCE

    (your-internet
      (every-page-you-have-ever-fetched)
      (your-structural-knowledge-of-the-web)
      ((every-page-you-have-ever-fetched . decomposed-to-pairs)
       (decomposed-to-pairs . registered-with-provenance)
       (registered-with-provenance . ETags-enable-change-detection)
       (ETags-enable-change-detection . synchronization-loop-keeps-current)
       (synchronization-loop-keeps-current . your-structural-knowledge-of-the-web)))

  )

  ((instance . internet-instance-registered)))
