Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1010C4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 05:51:01 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1518.1705038656070334451
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=g5na7XAL;
 spf=pass (domain: mvista.com, ip: 209.85.216.47, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28bec6ae0ffso3726444a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Jan 2024 21:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1705038655; x=1705643455; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t7OjHRR7siu7zM/n8bQYS7hACJjXCxPOUkpS/xc8zJM=;
        b=g5na7XALT8FrDhSBRNHNqlrOhk8QK1BtIx1k6c3ZdRsBGJnXaslwNJWR4/uUWUT8Jm
         p9OOthbXgcFOXeDEUgVOh0IkJbW61BfoU7VBQjYHzgM8D03lUdHyHI9h9cFWBGgsGihX
         CxGBiIrD6ewGkw5trMOESdthPrveiLkSHBixw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705038655; x=1705643455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7OjHRR7siu7zM/n8bQYS7hACJjXCxPOUkpS/xc8zJM=;
        b=QaWXOA8HbyTLVba/ThAJSbpyytrHmC91nClkbL+4UG0aS/TbL3aNU6633oi3Pj/q6m
         TD2y16wuKc19g8S/Gj0NFdNn6O69t4AIvIG42HwO/bDxmpuLeleb3mqUnRNueM6aJZlJ
         9cTVg1yWuEjx+LNIHquOeNIXxlIT6L96MVeu2sUXy/P4otZyRy66s5zhdBnKOmH7GOb3
         JeFurorG610+AeTmd1NoalyM3ESZObLtMF7WVaRqW4sDkP6fRwlgErfDl6J/lJOFTNCA
         dtvlOQIZtTN4LVgua2hEuD7TTIP6dtWiHQtn/VNWL0egszDutBycU8ipgUNS9I3Wyybg
         1xOw==
X-Gm-Message-State: AOJu0YwQc7Ccwky7Dw97acOdTOv+Z3hOW7WiDwV5Vcuvbk84OAAAHRjJ
	1LZKL8d8mf5kJrX3l07S3rILapGq9G1gXJdOOfZE3dpXk+M=
X-Google-Smtp-Source: AGHT+IGHp3uf9zav8azAgcosQaOFjxc/nQmLnzPN+efpPjsrhHvKcI5zKc3yfDeHHFXFZMaopTqyAg==
X-Received: by 2002:a17:90a:3941:b0:28c:2b87:8493 with SMTP id n1-20020a17090a394100b0028c2b878493mr738236pjf.30.1705038655188;
        Thu, 11 Jan 2024 21:50:55 -0800 (PST)
Received: from MVIN00016.mvista.com ([43.249.234.165])
        by smtp.gmail.com with ESMTPSA id o7-20020a1709026b0700b001d5383ae01csm2175877plk.121.2024.01.11.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 21:50:54 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: bruce.ashfield@gmail.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-cloud-services][PATCH] Remove tag values from SRC_URI to build recipe
Date: Fri, 12 Jan 2024 11:20:43 +0530
Message-Id: <20240112055043.74453-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jan 2024 05:51:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8537

To build the fluentd recipe, facing the
Bitbake Fetcher Error: FetchError("Recipe uses a floating tag/branch 'v1.9.2'
for repo 'github.com/fluent/fluentd.git' without a fixed SRCREV yet
doesn't call bb.fetch2.get_srcrev() (use SRCPV in PV for OE).", None)

To fix this issue, Remove tag values from SRC_URI for recipe and its dependent
recipe file.

Upgrade "cool.io", "http-parser.rb" and "strptime" recipe
to resolve the runtime dependency issue.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ruby/{cool.io_1.6.0.bb => cool.io_1.7.0.bb}             | 5 ++++-
 meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb       | 4 +++-
 .../{http-parser.rb_0.6.0.bb => http-parser.rb_0.6.1.bb}    | 6 +++++-
 meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb       | 5 ++++-
 meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb  | 6 +++++-
 meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb       | 6 +++++-
 .../ruby/{strptime_0.2.3.bb => strptime_0.2.5.bb}           | 6 +++++-
 .../recipes-devtools/ruby/tzinfo-data_1.2019.3.bb           | 6 +++++-
 meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb        | 6 +++++-
 meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb     | 6 +++++-
 10 files changed, 46 insertions(+), 10 deletions(-)
 rename meta-openstack/recipes-devtools/ruby/{cool.io_1.6.0.bb => cool.io_1.7.0.bb} (76%)
 rename meta-openstack/recipes-devtools/ruby/{http-parser.rb_0.6.0.bb => http-parser.rb_0.6.1.bb} (73%)
 rename meta-openstack/recipes-devtools/ruby/{strptime_0.2.3.bb => strptime_0.2.5.bb} (60%)

diff --git a/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb b/meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
similarity index 76%
rename from meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
rename to meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
index baa63403..10e9a498 100644
--- a/meta-openstack/recipes-devtools/ruby/cool.io_1.6.0.bb
+++ b/meta-openstack/recipes-devtools/ruby/cool.io_1.7.0.bb
@@ -4,9 +4,12 @@ HOMEPAGE = 'http://coolio.github.com'
 LICENSE = 'MIT'
 LIC_FILES_CHKSUM = 'file://LICENSE;md5=a5e7701a63eb0a961f98cd10475129b9'
 
-SRC_URI = 'git://github.com/tarcieri/cool.io.git;protocol=https;tag=v1.6.0'
+SRCREV = 'd7ab8518c11d8fe1b9a679a1686f01a295690fa9'
+
+SRC_URI = 'git://github.com/tarcieri/cool.io.git;protocol=https;branch=master'
 
 S = '${WORKDIR}/git'
 
 inherit ruby
 
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
index 94d1ec80..dc984d3a 100644
--- a/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
+++ b/meta-openstack/recipes-devtools/ruby/fluentd_1.9.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://www.fluentd.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ffc336af228834e68e0a4d38da165f7"
 
-SRC_URI = "git://github.com/fluent/fluentd.git;protocol=https;tag=v${PV};branch=master"
+SRCREV = "9d113029d4550ce576d8825bfa9612aa3e55bff0"
+
+SRC_URI = "git://github.com/fluent/fluentd.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
similarity index 73%
rename from meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
rename to meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
index 296b8dda..5452c126 100644
--- a/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.0.bb
+++ b/meta-openstack/recipes-devtools/ruby/http-parser.rb_0.6.1.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "https://rubygems.org/gems/http_parser.rb"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=157efc3766c6d07d3d857ebbab43351a"
 
-SRC_URI = "git://github.com/tmm1/http_parser.rb.git;protocol=https;tag=v0.6.0;branch=master"
+SRCREV = "c8dae7c6c2c78a5016d082a7fbda7e362292c14a"
+
+SRC_URI = "gitsm://github.com/tmm1/http_parser.rb.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
@@ -20,3 +22,5 @@ do_configure:prepend() {
 	cd ${WORKDIR}/git
 	git submodule update --init --recursive
 }
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
index f40d6cfe..53826767 100644
--- a/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
+++ b/meta-openstack/recipes-devtools/ruby/msgpack_1.3.3.bb
@@ -4,9 +4,12 @@ HOMEPAGE = "http://msgpack.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI = "git://github.com/msgpack/msgpack-ruby.git;protocol=https;tag=v${PV};branch=master"
+SRCREV = "64db1bac56359c9257d22f3ffb7506b578d76741"
+
+SRC_URI = "git://github.com/msgpack/msgpack-ruby.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 inherit ruby
 
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
index 516a72eb..553c5673 100644
--- a/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
+++ b/meta-openstack/recipes-devtools/ruby/serverengine_2.2.1.bb
@@ -4,10 +4,14 @@ HOMEPAGE = 'https://rubygems.org/gems/serverengine'
 LICENSE = 'Apache-2.0'
 LIC_FILES_CHKSUM = 'file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57'
 
-SRC_URI = 'git://github.com/treasure-data/serverengine.git;protocol=https;tag=v2.2.1'
+SRCREV = '99d44a0989ab3e64e14ac0367aadf76aa13b3583'
+
+SRC_URI = 'git://github.com/treasure-data/serverengine.git;protocol=https;branch=master'
 
 S = '${WORKDIR}/git'
 
 RDEPENDS:${PN} = "sigdump"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
index 2f6b8d5a..fc5152e8 100644
--- a/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
+++ b/meta-openstack/recipes-devtools/ruby/sigdump_0.2.4.bb
@@ -4,8 +4,12 @@ HOMEPAGE = "https://github.com/frsyuki/sigdump"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07d6218b18fb6826f04fd32b4918f085"
 
-SRC_URI = "git://github.com/frsyuki/sigdump.git;protocol=https;tag=v0.2.4;branch=master"
+SRCREV = "57570f04456560512e4efc1c6fa695b76c17dc0d"
+
+SRC_URI = "git://github.com/frsyuki/sigdump.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb b/meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
similarity index 60%
rename from meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
rename to meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
index 7167d9ab..d568272d 100644
--- a/meta-openstack/recipes-devtools/ruby/strptime_0.2.3.bb
+++ b/meta-openstack/recipes-devtools/ruby/strptime_0.2.5.bb
@@ -4,10 +4,14 @@ HOMEPAGE = "https://github.com/nurse/strptime"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f19575067ffc5f1ddc02c74eeef9904f"
 
-SRC_URI = "git://github.com/nurse/strptime.git;protocol=https;tag=v0.2.3;branch=master"
+SRCREV = "1583aaa510cae4660907b22c8262ab31b1eb1864"
+
+SRC_URI = "git://github.com/nurse/strptime.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN} = "bash"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
index 6b1d01ce..46407553 100644
--- a/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
+++ b/meta-openstack/recipes-devtools/ruby/tzinfo-data_1.2019.3.bb
@@ -4,8 +4,12 @@ HOMEPAGE = "https://tzinfo.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
 
-SRC_URI = "git://github.com/tzinfo/tzinfo-data.git;protocol=https;tag=v1.2019.3;branch=master"
+SRCREV = "74d5a2529d585e1d1ab47b6bbb2449cba29f6907"
+
+SRC_URI = "git://github.com/tzinfo/tzinfo-data.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
index 07680d7d..504e3a89 100644
--- a/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
+++ b/meta-openstack/recipes-devtools/ruby/tzinfo_2.0.1.bb
@@ -4,10 +4,14 @@ HOMEPAGE = "https://tzinfo.github.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c326926e773a4e99e89820f5d8a0966f"
 
-SRC_URI = "git://github.com/tzinfo/tzinfo.git;protocol=https;tag=v2.0.1;branch=master"
+SRCREV = "16b0ff837923401da52325312c51baf9bec700e1"
+
+SRC_URI = "git://github.com/tzinfo/tzinfo.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 RDEPENDS:${PN} = "concurrent-ruby"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
diff --git a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
index a0635e3a..f91d414a 100644
--- a/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
+++ b/meta-openstack/recipes-devtools/ruby/yajl-ruby_1.4.0.bb
@@ -4,8 +4,12 @@ HOMEPAGE = "http://rdoc.info/projects/brianmario/yajl-ruby"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7dbd3a9f471247a243db5b62fe091587"
 
-SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;tag=1.4.0;branch=master"
+SRCREV = "8830754ac1ca04a0c14f71f6e7c1d240934366fe"
+
+SRC_URI = "git://github.com/brianmario/yajl-ruby.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
 inherit ruby
+
+FILES:${PN} += "${libdir}/*"
-- 
2.25.1


