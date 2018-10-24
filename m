Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A67DE00AD8; Wed, 24 Oct 2018 12:35:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [135.84.80.216 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B837AE00994
	for <meta-virtualization@yoctoproject.org>;
	Wed, 24 Oct 2018 12:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540409719; cv=none; d=zoho.com; s=zohoarc; 
	b=b8z8nEUc7v+MqsxYa6j8HL2P/9jhzLCTOppkZG+6nUfMxd1mr/LzzRdqgD198vTzKrGLQvZrwOI6b3EaYBr4rv0Luk62wMCLLQoMVzhVKwtzl2Q/0/IH7G/fcrzKH6naSqMmAqNSXvL9eufmoT2qMYHGD42PJnMYKcE9o8BVJzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1540409719;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=3Uv/Ah5P7fmjm+0rr3BUla3S8IeMMAjFxqqh7HV7Moc=; 
	b=QtibTUXlpKUZ6nFdjgglK3gZypUcK8p+hUSJEtpG/3U4pRXOgwFmfTLqEm+D3U6+qrxtAWD3oJafL6vEez1hewyYRujZLR3BydzCyxiyxVgIS8EGAZz30XlA08K6ZwGWNm6rhzznrMxyfIHv2KNoekm5A4IrNTDfhT7n8E/EDmw=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1540409719; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=2739; bh=3Uv/Ah5P7fmjm+0rr3BUla3S8IeMMAjFxqqh7HV7Moc=;
	b=TMUbV6YsbvUjCktuURfeR/Es12ZzAs5A/QbLS9ZQl6abuzDDrS324zFN6Y5rjylR
	H8ujxu3AI7chz5wY81wAFd3ZwWre31NWldyIUbb/ylkTMblELAtKTxWUjGGmLzr5KPW
	7PUzGMMRM67c9pAaI3g/BPKfxNR7VIACn6geuMfg=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 154040971824619.487375933436056;
	Wed, 24 Oct 2018 12:35:18 -0700 (PDT)
Date: Wed, 24 Oct 2018 15:35:18 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <166a792f5e4.1082e3d49287565.8933791861338451987@apertussolutions.com>
In-Reply-To: <4d5b4b3d-0881-965c-b56a-d778a33437e0@windriver.com>
References: <166a67a004c.1185091d4239486.5035650420418090611@apertussolutions.com>
	<4d5b4b3d-0881-965c-b56a-d778a33437e0@windriver.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: ipxe: do_compile failing on rocko
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
X-List-Received-Date: Wed, 24 Oct 2018 19:35:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Randy,

Took me a while as I had edited outside of git.

Got all the way down to the "git send-email" command.

"git: 'send-email' is not a git command. See 'git --help'"
Sorry, I thought I could save you the trouble.

Sincerely,
Ken Bassford
Apertus Solutions

 ---- On Wed, 24 Oct 2018 14:54:14 -0400 Randy MacLeod <randy.macleod@windriver.com> wrote ---- 
 > On 10/24/18 10:28 AM, Ken Bassford wrote: 
 > > Hello again, 
 > >  
 > > Found another bug ... 
 > >  
 > > Received in log "...poky/build/tmp/work/core2-64-poky-linux/ipxe/gitrAUTOINC+8c43891db4-r0/temp/log.do_compile" 
 > >  
 > > Assembler messages: 
 > > "/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF' 
 > >  
 > > /tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'" 
 > >  
 > > Change to ipxe_git.bb that enabled compile to work. 
 >  
 > You've shown the error, that's good. It should go in the body / long log 
 > of you git commit message. 
 >  
 > You also need to explain why this change makes sense. 
 > In this case you can just point to the commit on master by saying: 
 >  
 > Set the isolinux bin variable used in Makefile as was done on 
 > master in commit: 
 >     fd68542 ipxe: recipe cleanup and uprev to current 
 >  
 > >  
 > > - #EXTRA_OEMAKE = "NO_WERROR=1" 
 > > + EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}"" 
 >  
 > Ken, 
 >  
 > Would you be able to re-submit as a patch as I did and 
 > explained for the SRC_URI change for seabios for morty? 
 >  
 > Thanks, 
 > ../Randy 
 > >  
 > > [reply] [-] Comment 1 Randy MacLeod 2018-10-24 14:19:29 UTC 
 > > Hi Ken and other meta-virt users who may read this defect, 
 > >  
 > > as you realize, ipxe is from: 
 > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/ipxe/ipxe_git.bb?h=master 
 > >  
 > > meta-virtualization doesn't use the YP bugzilla. 
 > > As it says in the meta-virt README: 
 > >  
 > > Maintenance 
 > > ----------- 
 > >  
 > > Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org 
 > >  
 > > Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com> 
 > >  
 > > When sending single patches, please using something like: 
 > > $ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH' 
 > >  
 > > --------------------------------------------- 
 > >  
 > > meta-virt is welcome to use bugzilla but they have decide to just use the email list. 
 > >  
 > > Sincerely, 
 > > Ken Bassford 
 > > Apertus Solutions 
 > >  
 > >  
 >  
 >  
 > --  
 > # Randy MacLeod 
 > # Wind River Linux 
 > 


