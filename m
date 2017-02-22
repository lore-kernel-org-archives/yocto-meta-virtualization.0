Return-Path: <nitishjha16@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDF81E00524; Wed, 22 Feb 2017 03:55:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (nitishjha16[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.223.176 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.223.176 listed in list.dnswl.org]
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8965EE003D7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Feb 2017 03:55:06 -0800 (PST)
Received: by mail-io0-f176.google.com with SMTP id j13so133213iod.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Feb 2017 03:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6D1Po67YTn8CeqclE4eO9vRSjUvZAZkuMx1sR0fXTM4=;
	b=BkW/w4bV/TEDPmFrtu4vGfxMpHJ8BAlJa/guMjEEazTn26qFEI2xBnEr3I+PjTgLPJ
	3GFXbMmcPxedKlOrB3U8/VpcR9eNdbMYmNgEiqQ4djBo52uDTIuje4VtLKG0xuP1ZPER
	jgyO6CRHsKsW5K6O4q7OfyQLs4FvMhgH/4RX3I2c3qL7Emurr805V9v5sHrEfyFxdRfq
	tl1k/JdkCXGy1CaABkrg0TLnYxeBxn1O5flY8JEkO8H5H3bzumwDzk8AE0N6lLTNc0Ft
	0/xutIlI45qyv/lq+zqgPeDx4kL9Gm8ybeN70jv/AJytwY7/rIF+shBhsfgsXuqI9rCb
	5Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6D1Po67YTn8CeqclE4eO9vRSjUvZAZkuMx1sR0fXTM4=;
	b=S8ND7J3TAtqejGPbDTGAcDnIUZUMWdjCmR2LWyC4ND0a5P6XSEl7Qq9m4dDfcWhiBX
	X2ImrFCvNLHl8JmkiiXrqv8JteLEqxpD4FXavp+p4xiT3g//anTG4jOmkKvmB3z7kvHf
	/EZlxzgNIDdaoH0yCX5ZCcj38ahvZ8B+9FBAmJzR9kw0Z3FhStuiQJGEOj2GgFcaP/R0
	0wE1JFZyNPplbPIJYidDZo60EpkPqHB15zqUO5tWwyZMiF2JpudWCir9GTOWRoLQdvBD
	QeU0LtHJVFnXBAhewWrC89qtvmM2BGjGPnUKNdJxNmksfmkonFAGYobNTKchnuW6bgM4
	UuTg==
X-Gm-Message-State: AMke39l1LpDxBYATQU++wMwO+IuAN4VYzzLnKGcqrBJlSNoLJ5AlLbMaCsF8FJFxPNCsEG9mwc1Izb5dxrk6yg==
X-Received: by 10.107.10.168 with SMTP id 40mr6085758iok.94.1487764505583;
	Wed, 22 Feb 2017 03:55:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.142.205 with HTTP; Wed, 22 Feb 2017 03:55:05 -0800 (PST)
In-Reply-To: <CABh+foapVgHwE40xENUqCegSsJ_Bqep-p+TQwV8rhDnF00bT1g@mail.gmail.com>
References: <CABh+foZ_SRHRa8Q296ESxS4Woj0AcoBbWSmuSJ=Z=W_Sy3raDQ@mail.gmail.com>
	<a88bb8cc-1232-6493-fbd2-7020cc373df9@cardoe.com>
	<CABh+foapVgHwE40xENUqCegSsJ_Bqep-p+TQwV8rhDnF00bT1g@mail.gmail.com>
From: nitish jha <nitishjha16@gmail.com>
Date: Wed, 22 Feb 2017 12:55:05 +0100
Message-ID: <CABh+foZMq3LTethWgLh1ndA_ApqW4-sX97k8JrUe7cvLzKAfiQ@mail.gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Error Building xen-image-minimal
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
X-List-Received-Date: Wed, 22 Feb 2017 11:55:08 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

Now I think there is certainly some Issue with building xen-image-minimal

Today I tried again with poky krogoth version and followed same steps
again, but I ended up with same error

ERROR: glibc-locale-2.23-r0 do_package: Fatal QA errors found, failing task.
ERROR: glibc-locale-2.23-r0 do_package: Function failed: do_package

without meta-virtualization layer, I build core-image-minimal it
worked fine but building xen-image-minimal with meta-virtualization
layers always end up with same error

can somebody help me to solve this.

Thanks and Regards

On Tue, Feb 21, 2017 at 11:50 PM, nitish jha <nitishjha16@gmail.com> wrote:
> Hello Doug
>
> I again tried compiling morty, meta-openmebedded and meta-vertualization
>
> And I am facing same Issue for glibc-locale-2.24-r0
>
> command I am using to down load package is
>
> git clone -b morty https://git.yoctoproject.org/git/poky
>
> git clone -b morty https://github.com/openembedded/meta-openembedded.git
>
> git clone -b morty https://git.yoctoproject.org/git/meta-virtualization
>
> my bblayers.conf looks like
>
> BBLAYERS ?= " \
>   /home/njking/yocto/poky/meta \
>   /home/njking/yocto/poky/meta-yocto \
>   /home/njking/yocto/poky/meta-yocto-bsp \
>   "
>
>
> BBLAYERS_NON_REMOVABLE ?= " \
>   /home/njking/yocto/poky/meta \
>   /home/njking/yocto/poky/meta-yocto \
>   "
>
> BBLAYERS += "/home/njking/yocto/meta-virtualization"
> BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-oe"
> BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-networking"
> BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-python"
> BBLAYERS += "/home/njking/yocto/meta-openembedded/meta-filesystems"
>
>
> and I have added following lines to the local.conf
>
> EXTRA_IMAGE_FEATURES += "ssh-server-openssh"
> MACHINE ?= "qemux86-64"
> DISTRO_FEATURES += "xen"
>
>
> It would be great help if you could tel me which poky, meta-openembedded and
> meta-virtualization version i should checkout so that i could build my
> xen-image-minmal successfully.
>
> Thanks and Regards
>
> Nitish
>
>
>
>
> On Sun, Feb 12, 2017 at 11:28 PM, Doug Goldstein <cardoe@cardoe.com> wrote:
>>
>> On 2/11/17 9:57 AM, nitish jha wrote:
>> > Hello All,
>> >
>> > I am tryin to build xen-image-minimal
>> >
>> > but I am getting following error
>> >
>> > ERROR: glibc-locale-2.24-r0 do_package: QA Issue: glibc-locale:
>> > Files/directories were installed but not shipped in any package:
>>
>> <snip>
>>
>> > Please set FILES such that these items are packaged. Alternatively if
>> > they are unneeded, avoid installing them or delete them within
>> > do_install.
>> > glibc-locale: 820 installed and not shipped files.
>> > [installed-vs-shipped]
>> > ERROR: glibc-locale-2.24-r0 do_package: Fatal QA errors found, failing
>> > task.
>> > ERROR: glibc-locale-2.24-r0 do_package: Function failed: do_package
>> > ERROR: Logfile of failure stored in:
>> >
>> > /home/njking/yocto_morty/build_xen_qemu/tmp/work/core2-64-poky-linux/glibc-locale/2.24-r0/temp/log.do_package.17564
>> > ERROR: Task
>> >
>> > (/home/njking/yocto_morty/poky/meta/recipes-core/glibc/glibc-locale_2.24.bb:do_package)
>> > failed with exit code '1'
>> >
>>
>> Unfortunately this issue is with the glibc package. Which does not live
>> in meta-virtualization. I'm at a loss why you would see that since I
>> build morty fairly regularly and haven't seen this. I would make sure
>> you are on the latest versions.
>>
>> --
>> Doug Goldstein
>>
>
>
>
> --

