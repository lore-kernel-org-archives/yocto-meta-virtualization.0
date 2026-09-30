Return-Path: <tanguy.raufflet@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2656CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:47:14 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15199.1790779632629856073
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=DM6BK23W;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: tanguy.raufflet@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 29FA63D8160C
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 10:47:11 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2d_c3SMo8_FJ; Wed, 30 Sep 2026 10:47:09 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5AB3C3D8165B;
	Wed, 30 Sep 2026 10:47:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5AB3C3D8165B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1790779629; bh=HHgRp6cTyvZ+zo6sXL2fX92Wkl4+baSeSAM/F6I+IIo=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=DM6BK23WxxzUvVrGJ2FnsHrHr5qpaWJ8spF8eAIjOnyiLnnAS5rTDsoC84OEQy0en
	 Hzj43Hsci61OBw1VKh6W4p+Z5mW201YmTQ3caL4ThrxhIuWbrq0OVdYxDGrn0FXXud
	 34wPpsm9PYk/diOmQeGJnKTTtgFRkJa/HpZNLJCcx67/RSXWHtiyKEqPkW1HrQ0blm
	 STXaNpQuDBShJdIrD9j5ESgfoPimWCQYLsrZhi05PV65Pltnl2AY3Go6Sv0s5R01qf
	 S2z1vmXrLlgvfPvoxvkb7O8QRi2UsMRgoSA0TWNvkCKytxzVlE7UC26kmdb/WXdHFE
	 VGSZhbz2+MYkw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 3I045r-qD6Ts; Wed, 30 Sep 2026 10:47:09 -0400 (EDT)
Received: from traufflet.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C48F23D8160C;
	Wed, 30 Sep 2026 10:47:08 -0400 (EDT)
From: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: enguerrand.de-ribaucourt@savoirfairelinux.com,
	Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Subject: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime bundle output
Date: Wed, 30 Sep 2026 16:47:04 +0200
Message-ID: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 30 Sep 2026 14:47:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10098

umoci currently uses an OCI runtime bundle as a temporary artifact
because umoci needs this intermediate representation to construct an OCI
image with the rootfs populated. After this step, the bundle is not used
anymore since umoci does not provide a mechanism to directly configure
the runtime bundle directly.

Because some utilities expect an OCI runtime bundle as input (e.g.,
crun, runc), it is useful to optionally retain the bundle after
constructing the OCI image. The comment [1] in the code was already
suggesting that retaining the OCI runtime bundle could be beneficial.

    "We could make this optional, since the bundle is directly runnable
    via runc"

This commit adds OCI_IMAGE_BUNDLE_OUTPUT to optionally deploy the
runtime bundle as a tar archive into IMGDEPLOYDIR. This bundle contains
the fully populated OCI runtime bundle, including the rootfs and the
config.json file reflecting the final OCI image configuration.

Also, a postprocess command can be specified to either modify the
runtime bundle's configuration or replace it entirely before it is
archived.

Note that image_bundle_name is not generated to the IMGDEPLOYDIR anymore
to avoid issues when BitBake processes and caches files under
IMGDEPLOYDIR.

Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
---
 classes/image-oci-umoci.inc | 41 ++++++++++++++++++++++--
 classes/image-oci.bbclass   | 13 ++++++++
 docs/container-bundling.md  | 64 +++++++++++++++++++++++++++++++++++++
 3 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
index 67f6c6e5..ad103f16 100644
--- a/classes/image-oci-umoci.inc
+++ b/classes/image-oci-umoci.inc
@@ -421,6 +421,34 @@ PYEOF
     bbnote "OCI fix: Layer whiteout fix complete"
 }
=20
+oci_archive_bundle() {
+    image_tag=3D"${@d.getVar("OCI_IMAGE_TAG").replace(":", "_")}"
+
+    ${IMAGE_CMD_TAR} --sort=3Dname --format=3Dposix --pax-option=3Ddelet=
e=3Datime,delete=3Dctime --numeric-owner \
+        -cf "${IMGDEPLOYDIR}/${IMAGE_NAME}.oci-bundle.tar" \
+        -C "${OCI_BUNDLE_DIR}" \
+        .
+
+    ln -sfn "${IMAGE_NAME}.oci-bundle.tar" \
+        "${IMGDEPLOYDIR}/${IMAGE_BASENAME}-$image_tag-oci-bundle.tar"
+
+    rm -rf "${OCI_BUNDLE_DIR}"
+}
+
+python oci_bundle_postprocess() {
+    from oe.utils import execute_pre_post_process
+
+    execute_pre_post_process(
+        d, d.getVar('OCI_BUNDLE_POSTPROCESS_COMMAND')
+    )
+    bb.build.exec_func('oci_archive_bundle', d)
+}
+
+oci_bundle_postprocess[dirs] =3D "${OCI_BUNDLE_DIR}"
+
+do_image_oci[postfuncs] +=3D "${@'oci_bundle_postprocess' if bb.utils.to=
_boolean(d.getVar('OCI_IMAGE_BUNDLE_OUTPUT')) else ''}"
+do_image_oci[subimages] +=3D "${@'oci-bundle.tar' if bb.utils.to_boolean=
(d.getVar('OCI_IMAGE_BUNDLE_OUTPUT')) else ''}"
+
 IMAGE_CMD:oci() {
     umoci_options=3D""
=20
@@ -477,7 +505,7 @@ IMAGE_CMD:oci() {
=20
     new_image=3Dt
     image_name=3D"${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci"
-    image_bundle_name=3D"${IMAGE_NAME}${IMAGE_NAME_SUFFIX}-oci-bundle"
+    image_bundle_name=3D"${OCI_BUNDLE_DIR}"
     if [ -n "$OCI_REUSE_IMAGE" ]; then
 	if [ -d $image_name ]; then
 	    bbdebug 1 "OCI: reusing image directory"
@@ -816,8 +844,15 @@ IMAGE_CMD:oci() {
 	ln -sfn "$image_name-dir.tar" "${IMAGE_BASENAME}-$image_tag-oci-dir.tar=
"
     fi
=20
-    # We could make this optional, since the bundle is directly runnable=
 via runc
-    rm -rf $image_bundle_name
+    if [ "${OCI_IMAGE_BUNDLE_OUTPUT}" =3D "1" ]; then
+        # Refresh config.json from the finalized image before post-proce=
ssing.
+        umoci raw runtime-config --rootless \
+            --image "$image_name:${OCI_IMAGE_TAG}" \
+            --rootfs "$image_bundle_name/rootfs" \
+            "$image_bundle_name/config.json"
+    else
+        rm -rf "$image_bundle_name"
+    fi
=20
     # This is the OCI image directory, which is technically the "image" =
as specified
     # Use -n to avoid creating link inside existing symlink target direc=
tory
diff --git a/classes/image-oci.bbclass b/classes/image-oci.bbclass
index 141cd2a8..cbbaa388 100644
--- a/classes/image-oci.bbclass
+++ b/classes/image-oci.bbclass
@@ -280,6 +280,19 @@ OCI_LAYER_CACHE_DIR ?=3D "${TOPDIR}/oci-layer-cache/=
${MACHINE}"
 # bundled into a tarball.
 OCI_IMAGE_TAR_OUTPUT ?=3D "true"
=20
+# Create a tar archive containing an OCI runtime bundle suitable for OCI=
 runtimes such as crun.
+OCI_IMAGE_BUNDLE_OUTPUT ?=3D "0"
+
+# Functions appended here run after the final runtime configuration is g=
enerated
+# and before the bundle is archived. The bundle directory is available a=
s
+# OCI_BUNDLE_DIR.
+OCI_BUNDLE_DIR =3D "${WORKDIR}/${IMAGE_BASENAME}-oci-bundle"
+OCI_BUNDLE_POSTPROCESS_COMMAND ?=3D ""
+
+python () {
+    d.setVarFlag('OCI_BUNDLE_POSTPROCESS_COMMAND', 'vardeps', d.getVar('=
OCI_BUNDLE_POSTPROCESS_COMMAND'))
+}
+
 # Generate a subarch that is appropriate to OCI image
 # types. This is typically only ARM architectures at the
 # moment.
diff --git a/docs/container-bundling.md b/docs/container-bundling.md
index 77aa09b0..bedd541e 100644
--- a/docs/container-bundling.md
+++ b/docs/container-bundling.md
@@ -288,6 +288,70 @@ Disable caching with `OCI_LAYER_CACHE =3D "0"` if yo=
u:
 - Need fully reproducible builds with no local state
 - Are debugging package installation issues
=20
+### OCI Runtime Bundles
+
+The umoci backend can emit an OCI runtime bundle suitable for runtimes s=
uch
+as crun and runc:
+
+    OCI_IMAGE_BUNDLE_OUTPUT =3D "1"
+
+The `app-container-oci-bundle` demo image enables this output and can be
+built with `bitbake app-container-oci-bundle`.
+
+The runtime configuration is generated from the finalized OCI image, so =
its
+`config.json` includes settings applied through `OCI_IMAGE_ENV_VARS`,
+`OCI_IMAGE_CMD`, `OCI_IMAGE_ENTRYPOINT`, `OCI_IMAGE_RUNTIME_UID`, and
+`OCI_IMAGE_WORKINGDIR`. It is deployed as:
+
+    ${IMAGE_BASENAME}-${OCI_IMAGE_TAG}-oci-bundle.tar
+
+with the convenience symlink:
+
+    ${IMAGE_BASENAME}-oci-bundle.tar
+
+`OCI_IMAGE_BUNDLE_OUTPUT` is independent of `OCI_IMAGE_TAR_OUTPUT`. The
+latter controls tar output for the OCI image layout (`index.json` and
+`blobs/`), while the runtime bundle contains `config.json` and `rootfs/`=
.
+
+Extract and run the bundle with crun:
+
+    mkdir my-container-bundle
+    tar -xf my-container-oci-bundle.tar -C my-container-bundle
+    crun run --bundle my-container-bundle my-container
+
+#### Bundle Post-processing
+
+Functions listed in `OCI_BUNDLE_POSTPROCESS_COMMAND` run after the final=
ized
+image is unpacked and before the bundle is archived. They run with
+`OCI_BUNDLE_DIR` as their current working directory:
+
+```bitbake
+OCI_BUNDLE_POSTPROCESS_COMMAND +=3D "configure_runtime_bundle;"
+
+configure_runtime_bundle() {
+    config=3D"config.json"
+    jq '.process.terminal =3D false' "$config" > "$config.tmp"
+    mv "$config.tmp" "$config"
+}
+```
+
+Post-processing changes only the emitted runtime bundle. It does not mod=
ify
+the OCI image configuration or its filesystem layers.
+
+To replace `config.json` completely, add the replacement to `SRC_URI` an=
d
+install it from a post-processing function:
+
+```bitbake
+SRC_URI +=3D "file://config.json"
+
+OCI_BUNDLE_POSTPROCESS_COMMAND +=3D "install_runtime_config;"
+
+install_runtime_config() {
+    install -m 0644 "${WORKDIR}/config.json" \
+    "config.json"
+}
+```
+
 ### OCI_IMAGE_CMD vs OCI_IMAGE_ENTRYPOINT
=20
     # CMD (default) - replaced when user passes arguments
--=20
2.55.0


