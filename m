Return-Path: <kbassford@apertussolutions.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A09FCE00BC1; Thu, 25 Oct 2018 07:44:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54790E006AF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Oct 2018 07:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540478668; cv=none; d=zoho.com; s=zohoarc; 
	b=ZhsutZj6Gf5gRIO7u2NMFBLSsZxpXrVYWZHexOyWjKYZlNPpJchjknzlBYTF80SUc5I7R3UCdess8kfYg4WvqF8mxIl42dHPFH6oNmFrNMh7zbUYRY1FlE5oP1O2RDvNjq/GQCQoNZFkDT754YR4Dc8Lb13If1mSihZYGNdNFHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1540478668;
	h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=pK5gwllDIKeBXB2wZLaAK4oSNc2ITm+cLU4iC+6KvtE=; 
	b=I7opx42D3nZbxplYrZ7GQS6HFK+y8LorIC5cQAWYt6+VfrgN1JObSWsYBkGFETSKcl7WPD6mJw/QbFx82aY60xTl3wwOEubhu+2Cpqunb1w5IaGNwkiWauDKEZ94yWnhLMVK58XUqHVvnl+Oz3w7yC7PO0bJv/NWAOiu+OAKoHY=
ARC-Authentication-Results: i=1; mx.zoho.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=kbassford@apertussolutions.com;
	dmarc=pass header.from=<kbassford@apertussolutions.com>
	header.from=<kbassford@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1540478668; 
	s=zoho; d=apertussolutions.com;
	i=kbassford@apertussolutions.com; 
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	l=7965; bh=pK5gwllDIKeBXB2wZLaAK4oSNc2ITm+cLU4iC+6KvtE=;
	b=rGgnvF1EuHKtKoSwIKMQ7emf9cuBjmgbraahxGg47aadriat/wP4XLhVHvzsypGX
	CourD14uNFX40D9RAUuq5GzIg364zLlnVKCzKmxqGhdV3BCzzNo4u12TTKiWUclUY2x
	Daf7EWgBN6wiUjvnKkI/4e2Wpq0a77N52MqCrs9U=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1540478667791778.762533405088;
	Thu, 25 Oct 2018 07:44:27 -0700 (PDT)
Date: Thu, 25 Oct 2018 10:44:27 -0400
From: Ken Bassford <kbassford@apertussolutions.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Message-ID: <166abaf0c0c.b3a6ae9614976.820835387775874086@apertussolutions.com>
In-Reply-To: <CADkTA4M2t7nOJS1Nm1+tkhrUhGz6V=odcB1Jxe48OgYJ-6OM=Q@mail.gmail.com>
References: <166a67a004c.1185091d4239486.5035650420418090611@apertussolutions.com>
	<4d5b4b3d-0881-965c-b56a-d778a33437e0@windriver.com>
	<166a792f5e4.1082e3d49287565.8933791861338451987@apertussolutions.com>
	<a6ebe150-0f25-c20c-d544-4c4e105ac342@windriver.com>
	<166a7ce394f.de62ba90296051.6001066251879603067@apertussolutions.com>
	<CADkTA4M2t7nOJS1Nm1+tkhrUhGz6V=odcB1Jxe48OgYJ-6OM=Q@mail.gmail.com>
MIME-Version: 1.0
X-Priority: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: meta-virtualization@yoctoproject.org
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
X-List-Received-Date: Thu, 25 Oct 2018 14:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Bruce,

The fix came from the master branch, I only copied the line of the master that enabled the compile in the rocko branch to complete.
(There were more lines changed in the master, but my objective was to get the recipe I had to compile.)

Again, I'm new at contributing and apologize for any transgressions in navigating the established netiquette.  Just wanted to pass on what worked so others didn't run into the same problem.  From my search of the internet it appears I'm far from the first to be bit by this bug.

I will try to establish a duplicate repo that has access to the outside so I can submit bugs in the approved manner, provided our IT/admins will allow it.  Thank you for your attention in this manner.

Sincerely,
Ken Bassford
Apertus Solutions

 ---- On Thu, 25 Oct 2018 05:59:57 -0400 Bruce Ashfield <bruce.ashfield@gmail.com> wrote ---- 
 > Also, we don't typically merge patches to old branches without merging 
 > something to master first. 
 >  
 > If the same breakage isn't in master, then we need an explanation of 
 > why it is only showing up on the old branch as part of the commit 
 > message 
 >  
 > Cheers, 
 >  
 > Bruce 
 > On Wed, Oct 24, 2018 at 4:41 PM Ken Bassford 
 > <kbassford@apertussolutions.com> wrote: 
 > > 
 > > Looks like it failed (not surprising considering our build server is semi-isolated). 
 > > (Below is what I tried to send from /var/mail/kbassford) 
 > > 
 > > Return-path: <kbassford@build-server1> 
 > > Received: from kbassford by build-server1 with local (Exim 4.84_2) 
 > >         (envelope-from <kbassford@build-server1>) 
 > >         id 1gFPp3-0005Io-JW 
 > >         for meta-virtualization@yoctoproject.org; Wed, 24 Oct 2018 16:32:09 -0400 
 > > From: Ken <kbassford@apertussolutions.com> 
 > > To: meta-virtualization@yoctoproject.org 
 > > Subject: 
 > > Date: Wed, 24 Oct 2018 16:32:05 -0400 
 > > Message-Id: <20181024203206.20337-1-kbassford@apertussolutions.com> 
 > > X-Mailer: git-send-email 2.11.0 
 > > 
 > > diff --git a/recipes-extended/ipxe/ipxe_git.bb b/recipes-extended/ipxe/ipxe_git.bb 
 > > index c0c8a7b..e0b386f 100644 
 > > --- a/recipes-extended/ipxe/ipxe_git.bb 
 > > +++ b/recipes-extended/ipxe/ipxe_git.bb 
 > > @@ -12,7 +12,7 @@ SRC_URI = "git://git.ipxe.org/ipxe.git;protocol=https" 
 > > 
 > >  FILES_${PN} = "/usr/share/firmware/*.rom" 
 > > 
 > > -EXTRA_OEMAKE = "NO_WERROR=1" 
 > > +EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}"" 
 > >  #PARALLEL_MAKE="" 
 > > 
 > >  S = "${WORKDIR}/git/src" 
 > > 
 > > # Received in log "...poky/build/tmp/work/core2-64-poky-linux/ipxe/gitrAUTOINC+8c43891db4-r0/temp/log.do_compile" 
 > > # 
 > > # Assembler messages: 
 > > # "/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF' 
 > > #  /tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'" 
 > > # 
 > > # This change reflects the current master branch for this file. 
 > > # 
 > > 
 > > 2.11.0 
 > > 
 > > Cheers, 
 > > Ken 
 > > 
 > > 
 > >  ---- On Wed, 24 Oct 2018 15:49:01 -0400 Randy MacLeod <randy.macleod@windriver.com> wrote ---- 
 > >  > On 10/24/18 3:35 PM, Ken Bassford wrote: 
 > >  > > Hi Randy, 
 > >  > > 
 > >  > > Took me a while as I had edited outside of git. 
 > >  > > 
 > >  > > Got all the way down to the "git send-email" command. 
 > >  > > 
 > >  > > "git: 'send-email' is not a git command. See 'git --help'" 
 > >  > > Sorry, I thought I could save you the trouble. 
 > >  > 
 > >  > I will teach you to fish! :) 
 > >  > 
 > >  > You need the git-email package on Ubuntu at least. 
 > >  > 
 > >  > I kind of knew that but I confirmed using: 
 > >  > $ git send-email --dry-run ... 
 > >  > with strace: 
 > >  > $ strace -f -o /tmp/gse.log git send-email --dry-run ... 
 > >  > 
 > >  > $ grep exec /tmp/gse.log | grep send-email | me-filtering-details 
 > >  > ... 
 > >  > .../usr/lib/git-core/git-send-email... 
 > >  > ... 
 > >  > 
 > >  > so checking that package: 
 > >  > $ dpkg -S /usr/lib/git-core/git-send-email 
 > >  > git-email: /usr/lib/git-core/git-send-email 
 > >  > 
 > >  > 
 > >  > Can you install that package and try again? 
 > >  > Don't forget about the git setup steps in: 
 > >  >    https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded 
 > >  > 
 > >  > If you get stuck, let me know. 
 > >  > 
 > >  > ../Randy 
 > >  > 
 > >  > 
 > >  > > 
 > >  > > Sincerely, 
 > >  > > Ken Bassford 
 > >  > > Apertus Solutions 
 > >  > > 
 > >  > >   ---- On Wed, 24 Oct 2018 14:54:14 -0400 Randy MacLeod <randy.macleod@windriver.com> wrote ---- 
 > >  > >   > On 10/24/18 10:28 AM, Ken Bassford wrote: 
 > >  > >   > > Hello again, 
 > >  > >   > > 
 > >  > >   > > Found another bug ... 
 > >  > >   > > 
 > >  > >   > > Received in log "...poky/build/tmp/work/core2-64-poky-linux/ipxe/gitrAUTOINC+8c43891db4-r0/temp/log.do_compile" 
 > >  > >   > > 
 > >  > >   > > Assembler messages: 
 > >  > >   > > "/tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF' 
 > >  > >   > > 
 > >  > >   > > /tmp/ccEectOc.s:28: Error: missing or invalid displacement expression `private_key_len@GOTOFF'" 
 > >  > >   > > 
 > >  > >   > > Change to ipxe_git.bb that enabled compile to work. 
 > >  > >   > 
 > >  > >   > You've shown the error, that's good. It should go in the body / long log 
 > >  > >   > of you git commit message. 
 > >  > >   > 
 > >  > >   > You also need to explain why this change makes sense. 
 > >  > >   > In this case you can just point to the commit on master by saying: 
 > >  > >   > 
 > >  > >   > Set the isolinux bin variable used in Makefile as was done on 
 > >  > >   > master in commit: 
 > >  > >   >     fd68542 ipxe: recipe cleanup and uprev to current 
 > >  > >   > 
 > >  > >   > > 
 > >  > >   > > - #EXTRA_OEMAKE = "NO_WERROR=1" 
 > >  > >   > > + EXTRA_OEMAKE = "NO_WERROR=1 ISOLINUX_BIN="${STAGING_DIR_TARGET}/usr/share/syslinux/isolinux.bin" CROSS_COMPILE="${TARGET_PREFIX}"" 
 > >  > >   > 
 > >  > >   > Ken, 
 > >  > >   > 
 > >  > >   > Would you be able to re-submit as a patch as I did and 
 > >  > >   > explained for the SRC_URI change for seabios for morty? 
 > >  > >   > 
 > >  > >   > Thanks, 
 > >  > >   > ../Randy 
 > >  > >   > > 
 > >  > >   > > [reply] [-] Comment 1 Randy MacLeod 2018-10-24 14:19:29 UTC 
 > >  > >   > > Hi Ken and other meta-virt users who may read this defect, 
 > >  > >   > > 
 > >  > >   > > as you realize, ipxe is from: 
 > >  > >   > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-extended/ipxe/ipxe_git.bb?h=master 
 > >  > >   > > 
 > >  > >   > > meta-virtualization doesn't use the YP bugzilla. 
 > >  > >   > > As it says in the meta-virt README: 
 > >  > >   > > 
 > >  > >   > > Maintenance 
 > >  > >   > > ----------- 
 > >  > >   > > 
 > >  > >   > > Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org 
 > >  > >   > > 
 > >  > >   > > Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com> 
 > >  > >   > > 
 > >  > >   > > When sending single patches, please using something like: 
 > >  > >   > > $ git send-email -1 -M --to meta-virtualization@yoctoproject.org --subject-prefix='meta-virtualization][PATCH' 
 > >  > >   > > 
 > >  > >   > > --------------------------------------------- 
 > >  > >   > > 
 > >  > >   > > meta-virt is welcome to use bugzilla but they have decide to just use the email list. 
 > >  > >   > > 
 > >  > >   > > Sincerely, 
 > >  > >   > > Ken Bassford 
 > >  > >   > > Apertus Solutions 
 > >  > >   > > 
 > >  > >   > > 
 > >  > >   > 
 > >  > >   > 
 > >  > >   > -- 
 > >  > >   > # Randy MacLeod 
 > >  > >   > # Wind River Linux 
 > >  > >   > 
 > >  > > 
 > >  > 
 > >  > 
 > >  > -- 
 > >  > # Randy MacLeod 
 > >  > # Wind River Linux 
 > >  > 
 > > 
 > > -- 
 > > _______________________________________________ 
 > > meta-virtualization mailing list 
 > > meta-virtualization@yoctoproject.org 
 > > https://lists.yoctoproject.org/listinfo/meta-virtualization 
 >  
 >  
 >  
 > --  
 > "Thou shalt not follow the NULL pointer, for chaos and madness await 
 > thee at its end" 
 > 


