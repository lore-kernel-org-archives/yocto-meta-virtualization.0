Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D788E0077F; Wed,  1 Oct 2014 10:34:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.182 listed in list.dnswl.org]
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92AD2E006DB
	for <meta-virtualization@yoctoproject.org>;
	Wed,  1 Oct 2014 10:34:08 -0700 (PDT)
Received: by mail-lb0-f182.google.com with SMTP id z11so798564lbi.13
	for <meta-virtualization@yoctoproject.org>;
	Wed, 01 Oct 2014 10:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yGKmXy8TIyUyKkScKD32fGN4ueeHDBI8RxgYCX3egTo=;
	b=CoYNd9QL3FwoSi0Y+pzhq4ahcZlIr2j7jSOz9L27aXCleK/atMIehADPfBsW8ihYkY
	wg5aQc9BbE2MCKDG5CKajLmwdM501F8fgRokcQ5T0kaUubgp67RJ8pcjdsYf9e9vBGri
	V4rtQElAsMi4agJ0Ma5D5DfU/MQH3hH6uUFrR9x/QRaW4cHaB6GAcYqlCngBtkp1qxkZ
	4sMFxTR7hXEWGCQdLm5aZdYdi6QvzVIxJuCpowNde4mBTpbpfwFIz5kLgbcg8ZrwCCV8
	++IbwXY26ckxmpzjgUswC224lMyWIvSzn18yTLIthrjFzo5kghPPGI9kmPNRKpd0JEyx
	NcfA==
MIME-Version: 1.0
X-Received: by 10.112.204.197 with SMTP id la5mr53367379lbc.2.1412184846717;
	Wed, 01 Oct 2014 10:34:06 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Wed, 1 Oct 2014 10:34:06 -0700 (PDT)
In-Reply-To: <CAFeBWL7WnEY=WMUvz508mKhiJj5NC3veckuQxPYAhnMMsHfLmw@mail.gmail.com>
References: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
	<CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
	<CAFeBWL7WnEY=WMUvz508mKhiJj5NC3veckuQxPYAhnMMsHfLmw@mail.gmail.com>
Date: Wed, 1 Oct 2014 13:34:06 -0400
Message-ID: <CADkTA4MSNGX2Lf0sL3x5YxPNZE3bHpYFFjEVeupjagQoXBi=pw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: uwsgi fails to get packaged with bad RPATH
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
X-List-Received-Date: Wed, 01 Oct 2014 17:34:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 1, 2014 at 1:09 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Thanks Bruce, can I have some information about your setup? Yocto version,
> layers involved?
>
> I appreciate it!

I'm always building the HEAD of pretty much everything, since that's where I
do all the development.

So in my case:

meta

meta-yocto

meta-yocto-bsp    = "master:d6da1f78cbf29c6c9ee3e0857a403e53daed256e"

meta-kernel-dev   = "master:7235853e3d88ace1d4a8784ba533e676a0e74edd"

meta-virtualization = "master:f5d690a773052c3406936d7e0f2e6af6b24c77c2"

meta-networking

meta-filesystems

meta-webserver

meta-python

meta-oe

meta-ruby         = "master:28e26a9b0ad37d0c92ba42b2727215eef1edf5a2"

meta-cloud-services

meta-openstack-controller-deploy

meta-openstack

meta-openstack-qemu = "master:d8c7fe8aa19b28249e50ea69127c392743d028dd"

Bruce


>
> Adam
>
> On Tue, Sep 30, 2014 at 10:02 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>> > Hello everyone, I am building uwsgi as a part of my image to run a web
>> > application on my embedded board.
>> >
>> > Ingredients including nginx builds fine, but I am getting the error
>> > attached. I am building on Yocto Project 1.6.1 (current master).
>>
>> Hmmm. I just did a completely clean build and didn't get any QA errors
>> with
>> respect to rpath.
>>
>> Hopefully someone else is seeing this and can help isolate the issue.
>>
>> Bruce
>>
>> >
>> > Any insight will be greatly appreciated!
>> >
>> > Adam
>> >
>> >> DEBUG: Executing python function sstate_task_prefunc
>> >> DEBUG: Python function sstate_task_prefunc finished
>> >> DEBUG: Executing python function do_package
>> >> DEBUG: Executing python function package_get_auto_pr
>> >> DEBUG: Python function package_get_auto_pr finished
>> >> DEBUG: Executing python function perform_packagecopy
>> >> DEBUG: Python function perform_packagecopy finished
>> >> DEBUG: Executing python function split_and_strip_files
>> >> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip'
>> >> --remove-section=.comment
>> >> --remove-section=.note
>> >>
>> >> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
>> >> DEBUG: Python function split_and_strip_files finished
>> >> DEBUG: Executing python function fixup_perms
>> >> DEBUG: Python function fixup_perms finished
>> >> DEBUG: Executing python function package_do_split_locales
>> >> DEBUG: No locale files in this package
>> >> DEBUG: Python function package_do_split_locales finished
>> >> DEBUG: Executing python function populate_packages
>> >> DEBUG: Python function populate_packages finished
>> >> DEBUG: Executing python function do_package_qa
>> >> NOTE: DO PACKAGE QA
>> >> NOTE: Checking Package: uwsgi-staticdev
>> >> NOTE: Checking Package: uwsgi-dev
>> >> NOTE: Checking Package: uwsgi-dbg
>> >> NOTE: arm-poky-linux-gnueabi-objdump -p
>> >>
>> >> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
>> >> NOTE: Checking Package: uwsgi-doc
>> >> NOTE: Checking Package: uwsgi
>> >> NOTE: arm-poky-linux-gnueabi-objdump -p
>> >>
>> >> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>> >> ERROR: QA Issue: package uwsgi contains bad RPATH
>> >> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
>> >>
>> >> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>> >> ERROR: QA run found fatal errors. Please consider fixing them.
>> >> DEBUG: Python function do_package_qa finished
>> >> DEBUG: Python function do_package finished
>> >> ERROR: Function failed: do_package_qa
>> >
>> >
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

