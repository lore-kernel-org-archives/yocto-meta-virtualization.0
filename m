Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6698E00AA5; Mon, 14 Dec 2015 12:47:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C0E6E002F9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Dec 2015 12:47:01 -0800 (PST)
Received: by wmnn186 with SMTP id n186so138382163wmn.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Dec 2015 12:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Vu95cgslVeZyxCVlHZM7Yiub/POb/d8Vdzfrh1DPw7c=;
	b=U2ZKYC5uO/FsHgnajvOtnG1jcdkwlkfY8rlm4jPaK49Wgr0onaiWxTMhPrSzfaUD2D
	hsaj6hQgwXdeFomgETXf224ln0u9VtL8okWOBO2RZWCvVQt2t9ER9F/2mHQ+fLyM4vc0
	gdoN+77lxUw0SeIMnv/5JUIN1wEvxur/+L3Uaex1d7ajGPqaupQlOMvGnLD5HWb4sf77
	20gc/ecqfE4W17xVYTSqrxXsW6qj/vAVQS5CUt5uWdFbuAzNGXuv79N9N6kq74Yx7zpW
	8tbSl7Dsw1OC4HlR6K82JiYbMu1fuwCSZMdlvzoiKTMBTjOuLCq0FGLsEW0UEfbo6Ppo
	UoBQ==
MIME-Version: 1.0
X-Received: by 10.28.68.213 with SMTP id r204mr183534wma.35.1450126021107;
	Mon, 14 Dec 2015 12:47:01 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Mon, 14 Dec 2015 12:47:00 -0800 (PST)
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8014090843F@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E8011BCDCE58@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CAPuovELJU9_nEBkP90HjexOctVSfs5Pc72f6FdvdkaKy3hywpQ@mail.gmail.com>
	<A8FC939F80655644A89BB21CCD3741E8014090843F@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Mon, 14 Dec 2015 15:47:00 -0500
X-Google-Sender-Auth: mf3Xj7iRggF2MfZivaJlIeE_z_s
Message-ID: <CAPuovEL2pTvLOpLN=xBP+fczUmf3WPQ89ou=ndbGgRyChty8bg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Help (python-jsonschema do_compile Failed)
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Dec 2015 20:47:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 13, 2015 at 8:46 PM, Li, Xin <lixin.fnst@cn.fujitsu.com> wrote:
> Hi, Mark and all,
>
> Thanks a lot for your help.
>
>>> When I bitbake python-jsonschema,the error is occurred in the step of
>>> do_compile as following:
>>> ------------------------------
>>>
>>> DEBUG: Executing shell function do_compile
>>>
>>> Download error on https://pypi.python.org/simple/vcversioner/: [Errno
>>> -5] No address associated with hostname -- Some packages may not be found!
>>>
>>> Couldn't find index page for 'vcversioner' (maybe misspelled?)
>>>
>>> Download error on https://pypi.python.org/simple/: [Errno -5] No
>>> address associated with hostname -- Some packages may not be found!
>>>
>>> No local packages or download links found for vcversioner
>>>
>>> Traceback (most recent call last):
>>>
>>>   File "setup.py", line 44, in <module>
>>>
>>> vcversioner={"version_module_paths" : ["jsonschema/_version.py"]},
>>>
>>> -------------------------------
>>>
>>> If you know how to fix it, Please tell me.
>>
>>A download error during do_compile(). My guess is that we have a missing
>>dependency. With python, Ruby and some other packages we have to be careful
>>as their builds will actually cause downloads to happen if a dependency is missing
>>(python will fetch eggs, ruby will fetch gems...). When I have time I usually do
>>builds with IP tables rules in place to force errors when these fetches happen so
>>that I can catch them and fix them. Downloads should only be done by the fetcher
>>and not bundler, pdb etc. If you see an error about downloading and you are not
>>in do_fetch() something is wrong.
>>
>>Start by adding python-vcversioner as a DEPENDS in python-jsonschema and you
>>should be good to go.
>>
>
> The python-vcversioner is already as a DEPENDS in python-jsonschema, and
> It is still failed.
>
> Perhaps it is the problem about proxy set.

No, again this would just be band-aid for a real problem. I did have
time to look at this today, but not enough to find a suitable
solution.

The issue is "setup_requires" in setup.py for python-jsonschema. This
is a rarely used directive that has some unexpected consequences. See:

https://github.com/pypa/pip/issues/410
https://pip.pypa.io/en/latest/user_guide/#installation-bundles
(warning at bottom of section)
https://pip.pypa.io/en/latest/reference/pip_install/#controlling-setup-requires

I can reproduce your issue by using iptables rules to DROP packets on
port 80 and 443.

The solution is one of 3.
1) We can cleanup the setup.py to not require vcversioner. This is
most likely the simplest but may have bad side effects.
2) We build vcversioner .egg file in an addition to do_compile() and
add it to the -dev pkg to ensure it is in the sysroot. We then copy
the egg from the sysroot to our build as a step before
python-jsonschema do_compile(). This is most likely the best fix.
3) We build the .egg as in (2) but build an index file in the sysroot,
allowing us to use find_links

I really believe (2) is the best approach. Building the egg and having
it in the sysroot is very straightforward, the copy shouldn't be that
difficult either. I can attempt this but most likely won't have a fix
until tomorrow. For now manually download the egg for vcversioner and
place it in tmp/work/core2-64-poky-linux/python-jsonschema/2.5.1-r0/jsonschema-2.5.1/.eggs/vcversioner-2.14.0.0-py2.7.egg
and you should be able to at least continue to build.

Mark


>
> When I bitbake python-jsonschema, the error occurs in the step of do_compile,
> But when I into directory "python-jsonschema/2.5.1-r0/jsonschema-2.5.1/ ", and run.do_complie, no errors occur.
> -----------------------------
> $ cd build-x86_64/tmp/work/x86_64 -linux/python-jsonschema/2.5.1-r0/jsonschema-2.5.1/
> $ ../temp/run.do_compile
> zip_safe flag not set; analyzing archive contents...
>
> Installed ***/work/x86_64 -linux/python-jsonschema/2.5.1-r0/jsonschema-2.5.1/.eggs/vcversioner-2.14.0.0-py2.7.egg
> running build
> running build_py
> creating build
> creating build/lib
> creating build/lib/jsonschema
> ......
> $ echo $?
> 0
> ---------------------------------
>
> And I have proxy set in ~/.wgetrc like this:
> http_proxy = http://rep.proxy.nic.fujitsu.com:8080/
> ftp_proxy = http://rep.proxy.nic.fujitsu.com:8080/
> https_proxy=https://rep.proxy.nic.fujitsu.com:8080/
>
> If you know how to fix it, please help me.
>
> Regards,
> Li
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

