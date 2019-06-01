Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79201E00B65; Fri, 31 May 2019 22:14:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7AC2E0043B
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 May 2019 22:14:55 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id v11so5172152pgl.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 31 May 2019 22:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BSMZMFHAEbsXLx1ERm20bknhhtZXP7CcPZRkjb7aLIA=;
	b=HzYm0gKpQQcDVkJEaQaNgdfW6PBF6Y8guGqPyBmKtY8xmE/IKi45ZBEas3lc5D0FOR
	VlMVhKPdyNmIdFSmfPdqC+ztmnceN3a4wuGYGsiI9ut/2i1uvTCkwFrelRtEJQsfo7cp
	dnUGeQ1hV+vI/9M7MO1tCtmfascLwU2ccDpKBUTDTi64XUvo+d/Ggm38qbgBGFQzJtxu
	VayXx7AggWeh0rHywvLkiDVV27RC7QjNfazuJUFAblv98989K8fQ1KP5fUKsYa1Tue2/
	5UvgMZPn8frMkUxOqf5WRhvCAmtPfaJCYBrzXiawkfiB/I1gCZkWxS4uJ5/uWlw8rg08
	SIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BSMZMFHAEbsXLx1ERm20bknhhtZXP7CcPZRkjb7aLIA=;
	b=n09si1+jp8nbzJXW0TeTKXjnpVJhvOenmxZ9WO1zizaOPbqPmlZwLYzV77Z4l5lswd
	wRlD8wxAcNVY8IC8uEl3Dcd+v3AMvkP0Uffon2XpaOZZB9RK4jRq+mgp+piLRhpkg5ny
	RxKVR+SsslI6Zf4byfyM+8Nev6KQURAIHcqiNeYnmvP8WmMGERC4Qdo0Zjyy0bQrrriU
	Sc8T4qe5bfbKa+n8YaBwZj20snZP6RxwlAu/DYMOpLZX5QaNkkl+IzD5FwLV/QOteYlA
	iJWbrZT9zqrwsJEh3cr4YdWy9jOcBXKBo3KwADIRy7opRSX45RTgu2l4EWoQLob19se2
	yqdg==
X-Gm-Message-State: APjAAAWArwVWiwWb/1HkDeWHEzq3SikSMycg8O2Vs6zpeCMMDr6Da/Yv
	u8xRKLlUZqhJry5N+XoOubTv1NJO
X-Google-Smtp-Source: APXvYqyXth2+u+AIW6ULhYq5CSv42jDj7tsJ2G68z7FFq/8mvFqsHmjl4e57QziSCPBNXG1jfYmfOQ==
X-Received: by 2002:a62:640e:: with SMTP id y14mr14101878pfb.109.1559366095072;
	Fri, 31 May 2019 22:14:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id
	l38sm6665446pje.12.2019.05.31.22.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 22:14:54 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 31 May 2019 22:14:52 -0700
Message-Id: <1559366092-20428-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud][PATCH] libvirt: Security fix CVE-2019-3840
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jun 2019 05:14:59 -0000

From: Armin Kuster <akuster@mvista.com>

Source: https://libvirt.org
MR: 97512
Type: Security Fix
Disposition: Backport from https://libvirt.org/git/?p=libvirt.git;a=commitdiff;h=9ed175fbc2deecfdaeabca7bc77c7e7ae33a3377
ChangeID: 6c662c67dd3cf6e0eba493b7b619db35f2e07d93
Description:

Fixes CVE-2019-3840

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libvirt/libvirt/CVE-2019-3840.patch            | 39 ++++++++++++++++++++++
 recipes-extended/libvirt/libvirt_4.7.0.bb          |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/CVE-2019-3840.patch

diff --git a/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch b/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch
new file mode 100644
index 0000000..8cca821
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/CVE-2019-3840.patch
@@ -0,0 +1,39 @@
+From 9ed175fbc2deecfdaeabca7bc77c7e7ae33a3377 Mon Sep 17 00:00:00 2001
+From: John Ferlan <jferlan@redhat.com>
+Date: Fri, 7 Sep 2018 16:01:27 -0400
+Subject: [PATCH] qemu: Remove duplicated qemuAgentCheckError
+
+Commit 5b3492fadb moved qemuAgentCheckError calls into
+qemuAgentCommand for various reasons; however, subsequent
+commit 0977b8aa0 adding a new command made call again
+So let's just remove the duplicitous call from
+qemuAgentGetInterfaces.
+
+Signed-off-by: John Ferlan <jferlan@redhat.com>
+ACKed-by: Michal Privoznik <mprivozn@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2019-3840
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/qemu/qemu_agent.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+Index: libvirt-4.7.0/src/qemu/qemu_agent.c
+===================================================================
+--- libvirt-4.7.0.orig/src/qemu/qemu_agent.c
++++ libvirt-4.7.0/src/qemu/qemu_agent.c
+@@ -1987,10 +1987,9 @@ qemuAgentGetInterfaces(qemuAgentPtr mon,
+     if (!(cmd = qemuAgentMakeCommand("guest-network-get-interfaces", NULL)))
+         goto cleanup;
+ 
+-    if (qemuAgentCommand(mon, cmd, &reply, false, VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK) < 0 ||
+-        qemuAgentCheckError(cmd, reply) < 0) {
++    if (qemuAgentCommand(mon, cmd, &reply, false,
++                         VIR_DOMAIN_QEMU_AGENT_COMMAND_BLOCK) < 0)
+         goto cleanup;
+-    }
+ 
+     if (!(ret_array = virJSONValueObjectGet(reply, "return"))) {
+         virReportError(VIR_ERR_INTERNAL_ERROR, "%s",
diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
index 5136798..270dc72 100644
--- a/recipes-extended/libvirt/libvirt_4.7.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
            file://lxc_monitor-Avoid-AB-BA-lock-race.patch \
+           file://CVE-2019-3840.patch \
           "
 
 SRC_URI[libvirt.md5sum] = "38da6c33250dcbc0a6d68de5c758262b"
-- 
2.7.4


