Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A916BCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 21:01:53 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13640.1777755709159175323
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 02 May 2026 14:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=el8wP6Za;
 spf=pass (domain: konsulko.com, ip: 209.85.215.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c796163fac5so1769898a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2026 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777755708; x=1778360508; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EB6eF7QKlypucxzN2Gi+1sNw/JFukJyXU8HqG2X/Pts=;
        b=el8wP6ZaV6mvhwyWzOTIhrMhKkPJV2AMztwlwLCrK1iGuuMlZEYlxAZfYqN059BtGP
         7BGXf/W5b0mr0eHVNfbLsHeCSa8qaGBflhff15oOELM3RLS8l4o33qePwyQnsjJVCkAF
         ZHq6AK196idBYxEbHSkZnS4w8fjmLjKe0ZoNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777755708; x=1778360508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EB6eF7QKlypucxzN2Gi+1sNw/JFukJyXU8HqG2X/Pts=;
        b=e/SZ8SMIh6WfhTYnlSflzsNy+ft7Z/CO7KKH9X55p1+/EW2cJ4BoV2wbRr8yOjOy6Y
         cK84EmyM+iygA8C18NOplvXQFXJ7YbiGmqxfnb665IbZgpEHprVxQgEI/6DAUVeHw398
         yHWl18wOSQ0u7lmS/zDYTRLKXNWUmr5tWpPZ7nD9+hEyuIU/rrsszx/sd93YCLaGTEyX
         g0b5uvpo+5Y4+4CvrX0RKY2bG7J3Ay5g64x3BGT6ssWS0gzESWsGF+IBIVMHBOhrAArM
         VSse+MR7EWcmiqIQEX/dN9uvs5dgUdE/Ax6j7Z400LCCKLO8mhAEuNsiymxdWx7Gqqho
         jPSQ==
X-Gm-Message-State: AOJu0YxAjzmsJDKYA49Ky5ruVqLK/B97CvB9xSiq2x55A6ArRKlFZUQY
	Eml4zLlsyc8PbMjWUcvH4T7xLPE7kgtBJ6Z6cJRSLxkz3xXfm0yJd0cAdKEUvfTP2rKumq1XeVH
	lm/Ka
X-Gm-Gg: AeBDiesFw2EUEuCkAHG5URd5fhdx3Qe9V/+UNkCEjH3/Du/CfZIIV4Le0ywYNJyhBtR
	kEdt3Qm2PQEMt5i/yt2I9tthKaqGMRAa5tFgQeQI/ZzTt3tBA9KBnY4H0d5an+CxoKAaeYMZEav
	Kfi4HWkCiVnxTow6prgLsw8mYQb9y7EuHHCEMyehXOZWAvqJXuOA+rrTqxdsrqPrlbcG46Q67S/
	DcuQwQVzfjpfGHJwH1gQXlVfUZthFmRjd1/wG1656/y+YgtoMmKQn5qt6XvnUxdtNwXGfZ+uHh2
	cGdi8NOH9Q0qiqBAGis2UJFsrgTl5g+yfoXXc8FKVONSfIw5kIEFa/iWuhxOyJsBGUP/mE5uPdP
	Ttz8E79+cm9SjS/UL8brnKY8OR1EsZPf9RW8x1hEhTbjh7ZWwYoYKmyeTp5Mv5cYmlgjABmnpBL
	clTPNFGJgzKrTZke8ovCFCvaAZnqEsjzY2mX8xgr8jbLGekyn3Ow==
X-Received: by 2002:a05:6a20:7d9f:b0:3a2:c685:f9af with SMTP id adf61e73a8af0-3a7f1cc0583mr4163670637.50.1777755708115;
        Sat, 02 May 2026 14:01:48 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6021:700:f870:4337:268a:bb6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515acfbcdsm7187249b3a.30.2026.05.02.14.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 14:01:47 -0700 (PDT)
From: tim.orling@konsulko.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH] image-oci: don't preserve ownership in directories/files/host layer copies
Date: Sat,  2 May 2026 14:01:40 -0700
Message-ID: <20260502210140.185898-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 May 2026 21:01:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9784

From: Tim Orling <tim.orling@konsulko.com>

The multi-layer 'directories', 'files', and 'host' branches in IMAGE_CMD:oci
copy delta content into the OCI bundle rootfs with 'cp -a'. 'cp -a' implies
'--preserve=all', which calls lchown() on the destination to copy ownership
from the source. When a directories/files layer copies a symbolic link whose
target does not exist at build time (for example, the '/dev/stdout' and
'/dev/stderr' log forwarding symlinks used by the official nginx Docker
image), lchown() can return EINVAL under pseudo and 'cp' aborts with:

    cp: failed to preserve ownership for .../var/log/nginx/access.log: Invalid argument

failing the whole do_image_oci task.

The single-layer rootfs copy already handles this correctly:

    cp -r -a --no-preserve=ownership ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs

and the multi-layer 'packages' branch uses 'rsync -a --no-owner --no-group'
for the same reason. Bring the three remaining cp -a sites in line by adding
'--no-preserve=ownership'. Ownership inside an OCI image is set by umoci
based on the image config and source ownership has no meaning for symlinks
to runtime device nodes anyway, so dropping preservation is the correct
behaviour.

Reproduce: declare a directories: layer that copies a path containing a
symlink to '/dev/stdout' or '/dev/stderr' (e.g. a postprocess that creates
/var/log/nginx/{access,error}.log -> /dev/{stdout,stderr} to mirror the
upstream nginx Docker image).

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 classes/image-oci-umoci.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index bad6c5d0..a033d73a 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -611,7 +611,7 @@ IMAGE_CMD:oci() {
                             oci_dst_file="$image_bundle_name/rootfs$oci_rel_path"
                             if [ ! -e "$oci_dst_file" ]; then
                                 mkdir -p "$(dirname "$oci_dst_file")"
-                                cp -a "$oci_src_file" "$oci_dst_file"
+                                cp -a --no-preserve=ownership "$oci_src_file" "$oci_dst_file"
                                 oci_delta_copied=$(expr $oci_delta_copied + 1)
                             else
                                 oci_delta_skipped=$(expr $oci_delta_skipped + 1)
@@ -638,7 +638,7 @@ IMAGE_CMD:oci() {
                         oci_dst_file="$image_bundle_name/rootfs$oci_file"
                         if [ ! -e "$oci_dst_file" ]; then
                             mkdir -p "$(dirname "$oci_dst_file")"
-                            cp -a "${IMAGE_ROOTFS}$oci_file" "$oci_dst_file"
+                            cp -a --no-preserve=ownership "${IMAGE_ROOTFS}$oci_file" "$oci_dst_file"
                             bbnote "OCI: Added file $oci_file"
                         else
                             bbnote "OCI: Skipped file $oci_file (already in bundle)"
@@ -657,7 +657,7 @@ IMAGE_CMD:oci() {
                     oci_host_dst="${oci_host_pair##*:}"
                     if [ -e "$oci_host_src" ]; then
                         mkdir -p "$image_bundle_name/rootfs$(dirname $oci_host_dst)"
-                        cp -a "$oci_host_src" "$image_bundle_name/rootfs$oci_host_dst"
+                        cp -a --no-preserve=ownership "$oci_host_src" "$image_bundle_name/rootfs$oci_host_dst"
                         bbnote "OCI: Added from host: $oci_host_src -> $oci_host_dst"
                     else
                         bbfatal "OCI: Host path not found: $oci_host_src"
-- 
2.47.3


