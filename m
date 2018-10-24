Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22D1BE00AD8; Wed, 24 Oct 2018 07:28:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [135.84.80.216 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3C59E00A0C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 07:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540391306; cv=none; d=zoho.com; s=zohoarc; 
	b=FBYRhB/TfipqJUupETmGL7swPZNuLl4gLiwuSTopBBahrvbCJKX6oD1dYE1SkbV18zB2DqGHXVSKtTD4VfPdFdoShx4h7DRTWPOajuaHGK4o6AzWdzaahfrvpooZjCiv1caCREuXfDmVnMmBDH74TG1hUSeHCsRN49zJUB9ce8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1540391306;
	h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results;
	bh=dtyGfhvXBMpYjC13Y2dxlIBHQmFZKC1Biz1x1Ghx83Y=; 
	b=fkCCn2i0UyCYnTFnCIiFc69a24LZESX5nGA9sbfIcIgGhpQqAvVg8iAdN8mlT8iphO2NL43YWZ6thuTXWksYp+fUC2OnQsM601mmCna0zu7zTTHYBEK6U2OYq1Y66xVtZj33HaNyBmo71dV8efImMGNLPHETzNSc4p2PyiHSziE=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1540391306; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=1490; bh=dtyGfhvXBMpYjC13Y2dxlIBHQmFZKC1Biz1x1Ghx83Y=;
	b=Lzknb+sUUsJerWDB7+KyTuHEWVprvDBt31mtL/V8Y8MSRks2J9heE67dAQAvqIlW
	ChM4+vlms1XI3FR8WmBtYSbZOLtz2sjKhA3Fzl/BStgTeakZTABhrDeCJlRLDzVmX7H
	NPFqtQjBiyjo25q2U3nenA6MNe9ChZ+7WwpQyWaM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 154039130529374.09305678088344;
	Wed, 24 Oct 2018 07:28:25 -0700 (PDT)
Date: Wed, 24 Oct 2018 10:28:25 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "meta-virtualization" <meta-virtualization@yoctoproject.org>
Message-ID: <166a67a004c.1185091d4239486.5035650420418090611@apertussolutions.com>
In-Reply-To: 
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Subject: ipxe: do_compile failing on rocko
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
X-List-Received-Date: Wed, 24 Oct 2018 14:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello again,

Found another bug ...

Received in log "...poky/build/tmp/work/core2-64-poky-linux/ipxe/gitrAUTOINC+8c43891db4-r0/temp/log.do_compile"

Assembler messages:
"/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'

/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'"

Change to ipxe_git.bb that enabled compile to work.

- #EXTRA_OEMAKE = "NO_WERROR=1"
+ EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}""

[reply] [-] Comment 1 Randy MacLeod 2018-10-24 14:19:29 UTC
Hi Ken and other meta-virt users who may read this defect,

as you realize, ipxe is from: 
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/ipxe/ipxe_git.bb?h=master

meta-virtualization doesn't use the YP bugzilla.
As it says in the meta-virt README:

Maintenance
-----------

Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org

Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>

When sending single patches, please using something like:
$ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH'

---------------------------------------------

meta-virt is welcome to use bugzilla but they have decide to just use the email list.

Sincerely,
Ken Bassford
Apertus Solutions



