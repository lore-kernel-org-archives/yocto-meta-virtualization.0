Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CE17E00ADB; Thu, 29 Mar 2018 14:14:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 390E8E00529
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 14:14:11 -0700 (PDT)
Received: by mail-lf0-f49.google.com with SMTP id t132-v6so10229520lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1keKOjTX0FzTtnyjQCjfRc8rUnI6Dvyic83Lk2cJgbY=;
	b=EgZPKfQC3q9r+SSGGYbKLO08B9A1pSE/2pA264pxJc6VCggp29OISrPHjKWycDMWO+
	VzIV4F6HclJRc3TfL7w/kpv/EAXiVF4zs2ujxS6tPekiJu10w1aPzpBfDPmnn0vtwMv/
	Tnbz+CuJoBZt/eK1LIHjfYhKL8JIyqhr4Waf9g0/TrRvdXlOLloxlavI3U3YHhtPOfNp
	osn9M+6H0Ebyt6GV1g0esneZzBSsmXvtQHZxzJQaCFyCVNTkJxY7ifbaHLc1QsHLQLu8
	YFjr9iORauf0etb+1KFokECVOWwpRcSIyquUh6VX3u8riKfSAglmp3U4uvs4ayxJ2paG
	e46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1keKOjTX0FzTtnyjQCjfRc8rUnI6Dvyic83Lk2cJgbY=;
	b=IBq1Oo5t+pRxAWDU4FeKjZkgDWwWJattKCaenEcVFX1dzxNScNScuB/e5F1zFXg23k
	8xd1NyFh7ESyyXW/gw2AYYwUi8tb4iBUNt+iqTVSd/lYaIIy9CTVN9VfB6/IpSj+tJbG
	m6VXovNGP4wmpODNftU79FkpJhyRKkuJRp/bzO/ALmGVOJc8m8+XCoQgNq14z74aXTCb
	EVpE492pNnszDr/Y8EEuJFAPgb9YZBK7b0QKUE7pJ9h1zIMLLhraPLCu7nQB/QKiHNsv
	4H6XxwmAUtIGZ/4PQUS7JAhnfi+H+KeP8nnL0t07ciLa7JgMFWLWwXpnIcW7BCGLDy6M
	Wa8g==
X-Gm-Message-State: AElRT7EOuU4TjXU2/jJWpnUeMPc5++y2xd2zOjY4og+L8ejylzVpNoAl
	7TP9D/eeMVzS8dAzwpghYhhR2pPnrplYGRwMkXn2C/ZS
X-Google-Smtp-Source: AIpwx48a9Ciq+hCYiHitS6tVcrWjvX/HVpA6ZPQNkMa5kwOpzPwU45x3+Zl80VJ1x2cUzEB+/B8llKKFHeZDqTW72IE=
X-Received: by 2002:a19:511d:: with SMTP id
	f29-v6mr6242675lfb.39.1522358050876; 
	Thu, 29 Mar 2018 14:14:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 29 Mar 2018 14:14:10 -0700 (PDT)
In-Reply-To: <DM2PR0201MB084744F1796CD7CF0E5B1994B0A20@DM2PR0201MB0847.namprd02.prod.outlook.com>
References: <1522100663-5563-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<CADkTA4MKWNcZdQwacNuXrM+-wfej4YNp4JCUoEY5b=TLw2j_Dg@mail.gmail.com>
	<DM2PR0201MB084744F1796CD7CF0E5B1994B0A20@DM2PR0201MB0847.namprd02.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Mar 2018 17:14:10 -0400
Message-ID: <CADkTA4PBxsXvPZu3MMXJKph7JbEeZ5pg7S7Xc--kzcpnSjJ4yw@mail.gmail.com>
To: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Cyril Chemparathy <cyrilc@xilinx.com>
Subject: Re: [meta-virtualization~][PATCH] inittab: fix hypervisor console
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
X-List-Received-Date: Thu, 29 Mar 2018 21:14:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 4:06 PM, Bhargava Sreekantappa Gayathri
<BSREEKAN@xilinx.com> wrote:
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Thursday, March 29, 2018 5:08 AM
>> To: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
>> Cc: meta-virtualization@yoctoproject.org; Cyril Chemparathy
>> <cyrilc@xilinx.com>; Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
>> Subject: Re: [meta-virtualization] [meta-virtualization~][PATCH] inittab: fix
>> hypervisor console
>>
>> When I apply the patch to meta-virt master, I get:
>>
>> error: patch failed: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend:1
>> error: removal patch leaves file contents
>> error: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend: patch does not apply
>>
>> While I could just remove the bbappend manually, that error implies that
>> whatever you are testing is not the same as the current master branch.
>>
>> So can you rebase and resend the patch as a v2 ?
>
> Hi Bruce,
>
> I have tried the patch on the master and it applies. I even tried the patch that I downloaded from the mailing list and it seems to work for me. This the latest master I have tried my patch on: 73f4778. Please let me know if I am missing anything.

I've applied a few patches in my day, and this definitely does not apply.

I'm doing the same workflow that I've done for 10 years, export the
mbox, apply it via git am

---------------

yow-bashfiel-d4 [/home/bruc...ualization]> git am -s hv.mbox
Applying: inittab: fix hypervisor console
error: patch failed: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend:1
error: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend: patch does not apply
Patch failed at 0001 inittab: fix hypervisor console
The copy of the patch that failed is found in:
   /home/bruce/poky/meta-virtualization/.git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

yow-bashfiel-d4 [/home/bruc...ualization]> git apply --reject
.git/rebase-apply/patch
Checking patch conf/distro/include/virt_console.inc...
Checking patch conf/layer.conf...
Checking patch recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend...
error: while searching for:
do_install_append() {
       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
               echo "" >> ${D}${sysconfdir}/inittab
               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >>
${D}${sysconfdir}/inittab
       fi
}

error: patch failed: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend:1
error: removal patch leaves file contents
error: recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend: patch does not apply
Applied patch conf/distro/include/virt_console.inc cleanly.
Applied patch conf/layer.conf cleanly.

---------

So your mailer, or something is mangling the patch to the point where it won't
apply.

Cheers,

Bruce



>
> Thanks,
> Bhargav
>>
>> Bruce
>>
>>
>> On Mon, Mar 26, 2018 at 5:44 PM, Bhargava Sreekantappa Gayathri
>> <bhargava.sreekantappa-gayathri@xilinx.com> wrote:
>> > From: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
>> >
>> > This commit switches over to using existing SERIAL_CONSOLES mechanism
>> > for hvc0 inittab entry generation.  This then results in
>> > /bin/start_getty wrapper being used, which avoids the getty failure
>> > seen when running a xen capable rootfs natively on linux.
>> >
>> > Signed-off-by: Cyril Chemparathy <cyril.chemparathy@xilinx.com>
>> > Signed-off-by: Manjukumar Matha
>> > <manjukumar.harthikote-matha@xilinx.com>
>> > Signed-off-by: Bhargava Sreekantappa Gayathri
>> > <bhargava.sreekantappa-gayathri@xilinx.com>
>> > ---
>> >  conf/distro/include/virt_console.inc                | 1 +
>> >  conf/layer.conf                                     | 3 +++
>> >  recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend | 6 ------
>> >  3 files changed, 4 insertions(+), 6 deletions(-)  create mode 100644
>> > conf/distro/include/virt_console.inc
>> >  delete mode 100644
>> > recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>> >
>> > diff --git a/conf/distro/include/virt_console.inc
>> > b/conf/distro/include/virt_console.inc
>> > new file mode 100644
>> > index 0000000..4d56806
>> > --- /dev/null
>> > +++ b/conf/distro/include/virt_console.inc
>> > @@ -0,0 +1 @@
>> > +SERIAL_CONSOLES_append = "${@bb.utils.contains('DISTRO_FEATURES',
>> 'xen', ' 115200;hvc0', '', d)}"
>> > diff --git a/conf/layer.conf b/conf/layer.conf index f71c117..461c73a
>> > 100644
>> > --- a/conf/layer.conf
>> > +++ b/conf/layer.conf
>> > @@ -20,6 +20,9 @@ LAYERDEPENDS_virtualization-layer = "core networking-
>> layer"
>> >  # Override security flags
>> >  require conf/distro/include/virt_security_flags.inc
>> >
>> > +# Add hypervisor console
>> > +require conf/distro/include/virt_console.inc
>> > +
>> >  PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
>> >  PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
>> >
>> > diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>> > b/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>> > deleted file mode 100644
>> > index 1b89aec..0000000
>> > --- a/recipes-core/sysvinit/sysvinit-inittab_2.%.bbappend
>> > +++ /dev/null
>> > @@ -1,6 +0,0 @@
>> > -do_install_append() {
>> > -       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
>> > -               echo "" >> ${D}${sysconfdir}/inittab
>> > -               echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >>
>> ${D}${sysconfdir}/inittab
>> > -       fi
>> > -}
>> > --
>> > 2.7.4
>> >
>> > This email and any attachments are intended for the sole use of the named
>> recipient(s) and contain(s) confidential information that may be proprietary,
>> privileged or copyrighted under applicable law. If you are not the intended
>> recipient, do not read, copy, or forward this email message or any attachments.
>> Delete this email message and any attachments immediately.
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

