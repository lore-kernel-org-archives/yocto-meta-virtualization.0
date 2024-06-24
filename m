Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA08C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 21:04:20 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.154085.1719263053132738702
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 14:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ILGbd2g9;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-440609dd118so21817261cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719263052; x=1719867852; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B3d4MAuS9rOBQHEwk0SO72i3IWk90F6RU/SgPx4URJw=;
        b=ILGbd2g9N7+3jeLrf5WaVZMDS7YepW/iVvt2RDMQ2C/2e4/dfaSLLzRQDmtJq1eTEQ
         u/+npPol98JOiEcwgszU1XqgxBc53pu/v+2fconePShd6gLUHH2vOsc6fur0nMju+VvX
         9KAWiJ/A2tqKtv7j7BiwcL6ZlosOJqaTHepHPy37W80H3bQ0ToWie93D9RmTJZgQguYq
         Bg7+G3QTyDGTvjwjxfMmVwGELbd2qWsXnnTmosF+x5hYNtM0ifdTpjgnSApg5XMlpptu
         tHOdFzTWjWwJXsJRWfygN+JWbgTdWJQaxMIOEe44czdnZ8vMNOUG4gQ2em+fCrZws0Jb
         SrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263052; x=1719867852;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3d4MAuS9rOBQHEwk0SO72i3IWk90F6RU/SgPx4URJw=;
        b=aLaURfrDDyu5lUvHFDCIMnp0WQPe9DeaSNiDpTgZwbiwTGiRl5fPcBKboXUUY6yaZj
         jy2omgTuWLbXNiYg3nTexVPMU4NYGwVMWkcR5kOhefa4VvB5G24y+N3h6eI4QCfge/jV
         I+G4djRWOKYJBezhgGtPui3KYoA5gfKQkmWzK9MUw2rhZjEcydhVBMeg2PjCKvytZqrI
         H0RQtN6/+sPCJToN6jNqncJWXhknNPGRZf+7gVO5y0mwQLqluMGvajqZm96aVuKbJ3zV
         jlT2XGTa0onI3b2PeW7lwThzXFQMXSQba4e1PbQNoSC47wp6ERg9WyDFAKDpOFN6XlmK
         A5rw==
X-Gm-Message-State: AOJu0Yy3UABSDzSnee0BJ3qI3deA6+cb9NMwXaY5HZ0Q0R1lB63D6Rwp
	n1JICLn0wby5kK1pGkDY/Ju218wSD4++0scdKPvdjvo8D0PCIWEp
X-Google-Smtp-Source: AGHT+IFD0YCu3lwISqn0gFO34Jkz6QuryxGWYmvosT48fH9HO9Z5ST8nGjaAHZGVMgLmqLaTusqWTQ==
X-Received: by 2002:a05:622a:38f:b0:443:572d:140d with SMTP id d75a77b69052e-444d917d441mr53836871cf.11.1719263051850;
        Mon, 24 Jun 2024 14:04:11 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2b4351esm46790431cf.17.2024.06.24.14.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:04:11 -0700 (PDT)
Date: Mon, 24 Jun 2024 21:04:09 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] netavark: Improve the ptest output
Message-ID: <ZnnfSaKb4JlqRGe0@gmail.com>
References: <20240624091010.787164-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624091010.787164-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 24 Jun 2024 21:04:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8809


staged to master-next.

Bruce

In message: [meta-virtualization] [PATCH] netavark: Improve the ptest output
on 24/06/2024 Yu, Mingli via lists.yoctoproject.org wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> * The previous ptest result show as ✓ or ✗ , improve the result to
> PASS or FAIL.
> 
> * Skip some cases related to sit0 device(sit kernel module) and
> firewalld.
> 
> * Add nftables to RDEPENDS for netavark-ptest as 250-bridge-nftables.bats
> needs it.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...rewalld-and-sit-module-related-cases.patch | 105 ++++++++++++++++++
>  recipes-containers/netavark/files/run-ptest   |   2 +-
>  .../netavark/netavark_1.10.3.bb               |   5 +
>  3 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/netavark/files/0001-test-skip-firewalld-and-sit-module-related-cases.patch
> 
> diff --git a/recipes-containers/netavark/files/0001-test-skip-firewalld-and-sit-module-related-cases.patch b/recipes-containers/netavark/files/0001-test-skip-firewalld-and-sit-module-related-cases.patch
> new file mode 100644
> index 00000000..7fb58a63
> --- /dev/null
> +++ b/recipes-containers/netavark/files/0001-test-skip-firewalld-and-sit-module-related-cases.patch
> @@ -0,0 +1,105 @@
> +From d527af68458f071215e70d6e5f952017f882a626 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Mon, 24 Jun 2024 15:40:57 +0800
> +Subject: [PATCH] test: skip firewalld and sit module related cases
> +
> +* Skip firewalld related cases as don't enable firewalld by default.
> +
> +* Skip some other cases as the sit0 device is automatically added to all
> +network namespaces then this will break many test assumptions [1].
> +
> +[1] https://github.com/containers/netavark/issues/984
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + test/100-bridge-iptables.bats | 4 ++++
> + test/250-bridge-nftables.bats | 2 ++
> + test/300-macvlan.bats         | 1 +
> + test/600-bridge-vrf.bats      | 1 +
> + 4 files changed, 8 insertions(+)
> +
> +diff --git a/test/100-bridge-iptables.bats b/test/100-bridge-iptables.bats
> +index 420547b..3ff5d04 100644
> +--- a/test/100-bridge-iptables.bats
> ++++ b/test/100-bridge-iptables.bats
> +@@ -496,6 +496,7 @@ fw_driver=iptables
> + }
> + 
> + @test "$fw_driver - port range forwarding dual - udp" {
> ++    skip
> +     test_port_fw ip=dual proto=udp range=3
> + }
> + 
> +@@ -858,6 +859,7 @@ EOF
> + 
> + 
> + @test "$fw_driver - bridge teardown" {
> ++    skip
> +     create_container_ns
> +     configs=()
> +     for i in 1 2; do
> +@@ -991,6 +993,7 @@ EOF
> + }
> + 
> + @test "$fw_driver - test firewalld reload" {
> ++    skip
> +     setup_firewalld
> + 
> +     run_netavark --file ${TESTSDIR}/testfiles/simplebridge.json setup $(get_container_netns_path)
> +@@ -1024,6 +1027,7 @@ EOF
> + }
> + 
> + @test "$fw_driver - port forwarding ipv4 - tcp with firewalld reload" {
> ++    skip
> +     test_port_fw firewalld_reload=true
> + }
> + 
> +diff --git a/test/250-bridge-nftables.bats b/test/250-bridge-nftables.bats
> +index 77bc12c..7876f53 100644
> +--- a/test/250-bridge-nftables.bats
> ++++ b/test/250-bridge-nftables.bats
> +@@ -913,6 +913,7 @@ EOF
> + }
> + 
> + @test "$fw_driver - test firewalld reload" {
> ++    skip
> +     setup_firewalld
> + 
> +     run_netavark --file ${TESTSDIR}/testfiles/simplebridge.json setup $(get_container_netns_path)
> +@@ -944,6 +945,7 @@ EOF
> + }
> + 
> + @test "$fw_driver - port forwarding ipv4 - tcp with firewalld reload" {
> ++    skip
> +     test_port_fw firewalld_reload=true
> + }
> + 
> +diff --git a/test/300-macvlan.bats b/test/300-macvlan.bats
> +index c062a7f..e646faf 100644
> +--- a/test/300-macvlan.bats
> ++++ b/test/300-macvlan.bats
> +@@ -329,6 +329,7 @@ EOF
> + 
> + @test "macvlan same interface name on container" {
> + 
> ++   skip
> +    read -r -d '\0' config <<EOF
> + {
> +    "container_id": "someID",
> +diff --git a/test/600-bridge-vrf.bats b/test/600-bridge-vrf.bats
> +index 4b95f93..dc90e92 100644
> +--- a/test/600-bridge-vrf.bats
> ++++ b/test/600-bridge-vrf.bats
> +@@ -6,6 +6,7 @@
> + load helpers
> + 
> + @test vrf - bridge with vrf {
> ++    skip
> +     run_in_host_netns ip link add test-vrf type vrf table 10
> +     run_in_host_netns ip link set dev test-vrf up
> + 
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/netavark/files/run-ptest b/recipes-containers/netavark/files/run-ptest
> index f6f90b15..59238d37 100644
> --- a/recipes-containers/netavark/files/run-ptest
> +++ b/recipes-containers/netavark/files/run-ptest
> @@ -9,6 +9,6 @@ for i in `ls test`; do
>       if [ $i == "200-bridge-firewalld.bats" ] || [ $i == "500-plugin.bats" ] ; then
>           continue
>       fi
> -     [ ${i: -4 -1} == ".bats" ] && NETAVARK=/usr/libexec/podman/netavark bats test/$i
> +     [ ${i: -4 -1} == ".bats" ] && NETAVARK=/usr/libexec/podman/netavark bats -t test/$i | sed -e '/^ok/ s/^ok/PASS: /g' | sed -e '/^not ok/ s/^not ok/FAIL: /g'
>  done
>  
> diff --git a/recipes-containers/netavark/netavark_1.10.3.bb b/recipes-containers/netavark/netavark_1.10.3.bb
> index b65b73e8..30c26f0b 100644
> --- a/recipes-containers/netavark/netavark_1.10.3.bb
> +++ b/recipes-containers/netavark/netavark_1.10.3.bb
> @@ -10,6 +10,7 @@ SRCREV = "d9f9fdc116ea3ed72a6eb4e59da33bf5d7c60b38"
>  #SRC_URI = "crate://crates.io/${BPN}/${PV}"
>  SRC_URI = "git://github.com/containers/netavark.git;protocol=https;branch=v1.10 \
>             file://tests.patch \
> +           file://0001-test-skip-firewalld-and-sit-module-related-cases.patch \
>             file://run-ptest"
>  require ${BPN}-crates.inc
>  
> @@ -33,6 +34,9 @@ do_install:append() {
>  
>  do_install_ptest() {
>  	cp -r ${S}/test ${D}${PTEST_PATH}
> +	for i in 200-bridge-firewalld.bats 400-ipvlan.bats 500-plugin.bats; do
> +		[ -f ${D}${PTEST_PATH}/test/${i} ] && mv ${D}${PTEST_PATH}/test/${i} ${D}${PTEST_PATH}/test/${i}.bak;
> +	done
>  }
>  
>  # rdepends on aardvark-dns which rdepends on slirp4netns
> @@ -54,6 +58,7 @@ RDEPENDS:${PN}-ptest += " \
>      iproute2 \
>      iputils \
>      jq \
> +    nftables \
>      nmap \
>      procps-ps \
>      util-linux-nsenter \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8805): https://lists.yoctoproject.org/g/meta-virtualization/message/8805
> Mute This Topic: https://lists.yoctoproject.org/mt/106846507/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


