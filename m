Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38738.1795372165350985111
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2026 10:29:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pBDkYBxS;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1183418a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795372165; x=1795976965; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ac83yD5NaBxzoXJ6Fdo5PXh4G00VbdyHz+c6ttP57Rw=;
        b=pBDkYBxSsiPm/x7BcwZqQfQmsh7k1WzpgqgS1JNoNkD0Xi+VHDzJYj+01Pl31Vr9w0
         7voOVLX09yF1K5H5zMSY6ymnKDbhx/75Wx0M2lwiXDLuieR55dv6MexCQyDRy0aVbrA3
         Ll8I9L6nvcV39rAMZ8CBFgpaWafAFICdsIDHxEWES9XyFktDLRrYCOiL5m9lOGLWMhmc
         UosvXG3k531rlLrBZtWocNaa/d2Hf6Krezcr2It7HkSs09hfCV61DOQfvFEh7K99qxnu
         bkM4VeFbbJA0uXVlq73cWMBYkipA5hblzAzJz3Tgaa6gSOCVXl9ujod98zd1mxNueno/
         YAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372165; x=1795976965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ac83yD5NaBxzoXJ6Fdo5PXh4G00VbdyHz+c6ttP57Rw=;
        b=b2zunnqFj7pz9VIZEe3cl/CUW6W64kL+/wyZt49KOgUW6NoWbO+vxo9h8T3ctX6i4n
         fNn5UISKsa+KOAvxCxvmS12wxrUNQF2qiih6bad8dJVukqOvAhRh44l2m5ahY6sQ/ju0
         Q1sMdk3CQYC8OaC0RYznSsPlJWLUghz43IB7u9GmhL5N6K5npxDies0jAaxod9Bi3dym
         F+DNtw2IYoS1/UNDH4hHxJhGT9QJ+TYCMeRyiKAZnwM0OLF1EpIy8ol1GsoI8NLyElft
         vNdnWNqV1d3otI1Ea7NAty551uM/DyN8TwOEj/WUf8SffvcJwrhKe+UEgXtNU61SEoKO
         GtdQ==
X-Gm-Message-State: APuU4Z8X03bUiAB7uG6GbwdsFRm8ivhT1cwZYUPhcNPtXlY4cF8cOx8H
	unr4wM4/UiLft9HB5LOsOi2hBJNUSrpiN/PiyF6IKTDRkGWitiszWIwy+tTXl1ek
X-Gm-Gg: AZFdTZdVyp7fu4He0H3W+H3VMa9rRgOv5hhPor9r3rncYOeE1qn0Lf+unorrFpRr/eW
	9JASZIVUjqO1SYUsigQpjvTuS3ZHD5hYzxjJK4qOJH+3mFHfi+lmZ93wwskS8gFOhDD8ORPVg7+
	yX/xYoh0ybXje2jA2L0jp39eeysosyV1sYM/OzJQqsLxppFQRLGQPf1Mn6d6Fn1Xnnu6XrwdM98
	r4+SwU+2srV2ovgqaU/vR5mKYvUvIKohjBpQRJbNox+cH2jNfHBZBv7BeDckQJzEk45puilHWSX
	xUxZW/w9cAypXr9GxnnMApsGSzxNuzGnUDtf0Oe+7tjuY0mgn5GW0oqZ3Ssqg+ipuqH/JAooMXI
	uPgRTbsyZvb8jQlkzu9/dUDo9c2nn+12M3gdQjX51VLqU/vpZtxTSaqcQJH3k9V3gIkashfO5kD
	KQDzF8XQyOrf/HN4tjtPCwBl0dFFhcxtWxIobOD4ejURASz8pNzezMMj4QC9V3tDdq+mQENneRR
	sRoH1Zv8mpZCGfpn42vNauTCDiEzxR3PBEbYgWgx30ppiar92OUbu0CmZKMYL1nz05yIqXvfEgB
	jIhFAxcAiHy+nFfjqwZHOfEMQhNFDvedDlBvJDcN5KG3LcHKMZbIqiGdt5qYyR1DbSmmydlRc+N
	KV4+c2rsKncsmxje9ysPxzNVIdEaQDYPofZP7tYqDOAZcWA==
X-Received: by 2002:a17:90b:5848:b0:3b0:a4d1:6d75 with SMTP id 98e67ed59e1d1-3b40a647c0dmr7237389a91.55.1795372164542;
        Sun, 22 Nov 2026 10:29:24 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain (c-24-20-171-118.hsd1.or.comcast.net. [24.20.171.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0818c1sm3882952a12.30.2026.11.22.10.29.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 10:29:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-virtualization][PATCH 0/3] OCI multi-layer fixes for dnf5 and nginx
Date: Sun, 22 Nov 2026 10:29:07 -0800
Message-ID: <20261122182910.35849-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 18:29:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10175
Content-Type: text/plain; charset="utf-8"

Since oe-core moved to dnf 5.4.7.0, every OCI_LAYER_MODE = "multi"
image fails to install its packages: layers, because the layer rootfs
under ${WORKDIR}/oci-layer-rootfs is not tracked by pseudo. Patch 1
fixes that.

Patches 2 and 3 fix the long-standing "OCI: Directory not found in
IMAGE_ROOTFS" warnings from app-container-nginx: empty_var_volatile
was wiping the container-volatile-fixup directories, and nginx's /run
and /var/log directories are never created outside of boot-time
tmpfiles.d.

Tested with the containers-library autobuilder target (aarch64 and
x86-64): all containers build with no warnings.

[YOCTO #16531]

Tim Orling (3):
  image-oci: track multi-layer rootfs directories with pseudo
  container-volatile-fixup: run after empty_var_volatile
  app-container-nginx: create /run/nginx and /var/log/nginx in rootfs

 classes/container-volatile-fixup.bbclass         |  9 ++++++++-
 classes/image-oci.bbclass                        |  8 ++++++++
 recipes-containers/images/app-container-nginx.bb | 11 +++++++++++
 3 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 89b00d096a432000766729cd721ae647af500112
-- 
2.56.1

