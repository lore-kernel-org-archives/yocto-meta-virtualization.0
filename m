Return-Path: <jkrishnanjanappa@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85C82E00EB4; Tue, 16 Jan 2018 22:25:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75884E008A4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jan 2018 22:25:01 -0800 (PST)
Received: by mail-pf0-f195.google.com with SMTP id p1so11011146pfh.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jan 2018 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=bphiYEuL72POAoK3GwlAUV8Yr0EcP3+Uo+AObRw6nbg=;
	b=Vx2wGyfCrxolh5TL1RSldLZwrUuySBwtFlpEwOYvLp/R60M4Lj0tPWWo7mzNS6uJjo
	2U9/3AclAR1xmZ8J6BhnodGkVeXMV3bvuaYw78/RE9w8IbgsyxfRUP+/iC92bKly4kMI
	01z8CsQIpO7veQbJy2CyhZCg5aFSDsxUlDuorZGkeHMbf06ffAWssZDK9xkMi4ZCaGeO
	irrhBuN8qk8OKKICBzRDWekIhRs5Dr6FQm0xetHFhsUP2FhkPlzfZp4qo8ArpuBoBylU
	IrcOq93iYs6CNvBM03KeZh+eENJpllHcqnJ7rAkUAsCju/QM+IfzKg+VJDKCdDzt3Ke1
	ODNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bphiYEuL72POAoK3GwlAUV8Yr0EcP3+Uo+AObRw6nbg=;
	b=EEPF8uQgudAq15S2g+JV8IpGcaudm2McHpJ+ApHVRZXsEzBsw1RsopQBAiQNosztkw
	oIvv2OSh8ditgMcoczmI9xKINA0jVIi0exhlFYMnFxqNrdqoRYo5oZiZUnUHQw3KkKW3
	R7KQX8kOi4Zp6tiFCnphK4pQxfT6kZJVrwh12ZrTQIX4V3YUBtJG9Y1OIb5KvR7cIFsU
	z5xQvqqq0t7s+beNt/uweKPjNTb9+kDVM2X4Ytb4Utjd8IXWllaI5dJ1oROScGU0KuKY
	PjYM0/1oAAF6zshGjaSDQacU7NuBj1ShHO9/a8PSmcUlrAhXUphOJ0a7/vReHWA3r3S1
	iENg==
X-Gm-Message-State: AKGB3mIPxuZPqcE58eyIaegmRpAUAuDBeIK5guUkLjsIGCOkeBMvc5HO
	H++I/8zKlI7zSmDbAem8OFVHnvRA
X-Google-Smtp-Source: ACJfBosysQNn068AyqXbiRhaAq984j1nmcEl75U1OYX1tBlguQfXwb4k3ol4u3GYNyy63X8YdV9drA==
X-Received: by 10.99.107.201 with SMTP id g192mr25344933pgc.295.1516170299705; 
	Tue, 16 Jan 2018 22:24:59 -0800 (PST)
Received: from jkrishnanjanappa-VPCEB26FG.mvista.com ([157.49.245.89])
	by smtp.gmail.com with ESMTPSA id
	e189sm5147329pfa.4.2018.01.16.22.24.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Jan 2018 22:24:59 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: meta-virtualization@yoctoproject.org
Date: Wed, 17 Jan 2018 11:52:51 +0530
Message-Id: <1516170171-9569-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][rocko][PATCH] cni: fix build error for arm64
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
X-List-Received-Date: Wed, 17 Jan 2018 06:25:02 -0000

Replace syscall.Dup2 calls with syscall.Dup3, as syscall.Dup2 is not
supported for arm64.

Solves below error:
-- snip --
Log data follows:
| DEBUG: Executing shell function do_compile_ptest_base
...
| # import/vendor/github.com/onsi/ginkgo/internal/remote
| ../../vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go:34:2: undefined: syscall.Dup2
| ../../vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go:35:2: undefined: syscall.Dup2
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 recipes-networking/cni/cni_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index 427a812..c83a56e 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -29,6 +29,10 @@ inherit go
 inherit goarch
 
 do_compile() {
+	if [ "${TARGET_GOARCH}" = "arm64" ]; then
+		sed -i "s:syscall.Dup2\(.*\))$:syscall.Dup3\1, 0):g" \
+		${S}/src/import/vendor/github.com/onsi/ginkgo/internal/remote/output_interceptor_unix.go 
+	fi
 	export GOARCH="${TARGET_GOARCH}"
 	export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 	export GOPATH="${S}/src/import:${S}/src/import/vendor"
-- 
2.7.4


