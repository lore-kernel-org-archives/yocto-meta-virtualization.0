Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9BE8E00A0C; Mon,  4 Feb 2019 09:08:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (cjp256[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD11AE0048C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Feb 2019 09:08:16 -0800 (PST)
Received: by mail-qk1-f196.google.com with SMTP id q1so339992qkf.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 04 Feb 2019 09:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1ZfrpFAPcVwe1fdl+g91oQ+3oEoxRA0M1AdojeHPwT8=;
	b=BR5kZpD2+kiLqErNi4IOlEEQqRyjMMWYYhexdgSAKSJXz2eslbwTnU7dJR1lgmhJPF
	whIezU7MzJDbMyn6H9yT12Y0WteTt29/wJsRdWz8EGXK6SySrIaAfjIXoiEVBA5W0FRb
	ABzMMbBp2pK7GDi8dyMAVLrZTiSW9NV8M7mXIL3pqU4IvclVhkNG5pfX4qrwTtrfE5Cg
	v9DHWaP3V6i44JrbbYERyekHbu89xEwkqu2xTPRZbLkxkJx66DqDi9RC3QzUJTr9eNqf
	v/cdd3gSIYqYwHYFXI4Fv552ZOTLORxuSxJfVi9/vz/QmdKNe25OSlr9bFAfQNzLavtJ
	gj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1ZfrpFAPcVwe1fdl+g91oQ+3oEoxRA0M1AdojeHPwT8=;
	b=DCMo+K38h5qKsYaZEVRpwVfpiwYrfPSSozqbyCVummKMxEL52g29EZRi3xuBgnfTF2
	qSgcaveOyRt1zF1yMl0yAbZ8VRdD/0/VtdCcE/vGO/E64DiVUQY3XVO3wt5kkkzbEWG5
	yplmUP7J9/745n2LLo3YB/zjqUZemZmLPyqV0mQcEyZG6N0nnE5rx3JfmVc1ljcTYXnI
	fBGJK4LFDETcP6sjfkn9cSyJw7tR+aKPwvoOTQd/xK+cYn7Unl/H7qXRaOJbtYIBtPSQ
	5bXxttXyA4tNeEFkzSXFOQ0WqiDDvjFUBpNqhMEWi+K1PDDD63xYidkG3dEMY3Lcjam4
	QWyw==
X-Gm-Message-State: AHQUAuYAgC1a3tIGRukN8A5WcHX5+Xk31R4zG0QmDX8ySUuwJaoATgT1
	g33cl4A2gNufUV2Z7a3ZJ0zAg+nl
X-Google-Smtp-Source: AHgI3IYBpI92NIHi5tPKSTdhAW4hpFUj9xE4yJ2ogEqbY2rWpBp2r4AEThQM11biXio1YT3ALKOUkQ==
X-Received: by 2002:a37:2c02:: with SMTP id s2mr287008qkh.59.1549300095108;
	Mon, 04 Feb 2019 09:08:15 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	j129sm6064153qkd.18.2019.02.04.09.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Feb 2019 09:08:12 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  4 Feb 2019 12:08:07 -0500
Message-Id: <1549300087-30904-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [PATCH] libvirt: fix dependency for libxl
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
X-List-Received-Date: Mon, 04 Feb 2019 17:08:18 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

"libxl" package does not exist, use Xen.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 recipes-extended/libvirt/libvirt_4.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_4.9.0.bb b/recipes-extended/libvirt/libvirt_4.9.0.bb
index 768cf0e..ccd4f83 100644
--- a/recipes-extended/libvirt/libvirt_4.9.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.9.0.bb
@@ -194,7 +194,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
 PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
 PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
 PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
-PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
+PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
 PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
 PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
 PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
-- 
2.1.4


