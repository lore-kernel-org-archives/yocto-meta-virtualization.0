Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BDA0E00876; Tue, 30 Sep 2014 22:02:24 -0700 (PDT)
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
	*      [209.85.217.179 listed in list.dnswl.org]
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71B3EE0079A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 22:02:13 -0700 (PDT)
Received: by mail-lb0-f179.google.com with SMTP id l4so60195lbv.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Sep 2014 22:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ox7hED0vTf/mrXovGbcgj8GDoGyTimTTgHFnWGLX1pw=;
	b=qXoHCz0O5AbVVDNKZFWdMM2u9iSi9advG5dLD5j2cR9V5mYbOqe9OHQg0v0PndXCjk
	NieFt3zzbWOhmlyvPRhJmjImJm7n/Abe3V/9CWUQCiJjlEFNp8nuSUtM9y/1ghqvz/uX
	hgmXGxDbXDQIkxOQFEmWVONV3RwYhiIeUZZQtAThICclG3O00YHZkDU2EIDCZYzqBS1w
	1Lzt2Vh7wbtPH2UCV/5OyVJ1iXLrqZEW184idGe3USfVRzD8cP97R/9geFFPhuPJCbkR
	tiW8p84IcS1xPsQwuhTmJUEaJqBf0FuI9k0K/ACARqOQ2zO1eBN8IxUgDXz4uAFbGKrL
	4tmg==
MIME-Version: 1.0
X-Received: by 10.152.36.37 with SMTP id n5mr16111067laj.93.1412139731425;
	Tue, 30 Sep 2014 22:02:11 -0700 (PDT)
Received: by 10.112.44.234 with HTTP; Tue, 30 Sep 2014 22:02:11 -0700 (PDT)
In-Reply-To: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
References: <CAFeBWL5qa-SEyJ-cwup-PLHszx0X+yy9aKOjCneis7fm5zJtYw@mail.gmail.com>
Date: Wed, 1 Oct 2014 01:02:11 -0400
Message-ID: <CADkTA4Mu5hZz5Y4HTopSH46iBe4je=Hs899Fm13yrsJMnXkFNg@mail.gmail.com>
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
X-List-Received-Date: Wed, 01 Oct 2014 05:02:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 6:43 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Hello everyone, I am building uwsgi as a part of my image to run a web
> application on my embedded board.
>
> Ingredients including nginx builds fine, but I am getting the error
> attached. I am building on Yocto Project 1.6.1 (current master).

Hmmm. I just did a completely clean build and didn't get any QA errors with
respect to rpath.

Hopefully someone else is seeing this and can help isolate the issue.

Bruce

>
> Any insight will be greatly appreciated!
>
> Adam
>
>> DEBUG: Executing python function sstate_task_prefunc
>> DEBUG: Python function sstate_task_prefunc finished
>> DEBUG: Executing python function do_package
>> DEBUG: Executing python function package_get_auto_pr
>> DEBUG: Python function package_get_auto_pr finished
>> DEBUG: Executing python function perform_packagecopy
>> DEBUG: Python function perform_packagecopy finished
>> DEBUG: Executing python function split_and_strip_files
>> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip' --remove-section=.comment
>> --remove-section=.note
>> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
>> DEBUG: Python function split_and_strip_files finished
>> DEBUG: Executing python function fixup_perms
>> DEBUG: Python function fixup_perms finished
>> DEBUG: Executing python function package_do_split_locales
>> DEBUG: No locale files in this package
>> DEBUG: Python function package_do_split_locales finished
>> DEBUG: Executing python function populate_packages
>> DEBUG: Python function populate_packages finished
>> DEBUG: Executing python function do_package_qa
>> NOTE: DO PACKAGE QA
>> NOTE: Checking Package: uwsgi-staticdev
>> NOTE: Checking Package: uwsgi-dev
>> NOTE: Checking Package: uwsgi-dbg
>> NOTE: arm-poky-linux-gnueabi-objdump -p
>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
>> NOTE: Checking Package: uwsgi-doc
>> NOTE: Checking Package: uwsgi
>> NOTE: arm-poky-linux-gnueabi-objdump -p
>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>> ERROR: QA Issue: package uwsgi contains bad RPATH
>> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
>> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
>> ERROR: QA run found fatal errors. Please consider fixing them.
>> DEBUG: Python function do_package_qa finished
>> DEBUG: Python function do_package finished
>> ERROR: Function failed: do_package_qa
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

