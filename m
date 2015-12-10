Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DD2CE00ABE; Thu, 10 Dec 2015 06:55:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.51 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF213E00457
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Dec 2015 06:55:45 -0800 (PST)
Received: by mail-wm0-f51.google.com with SMTP id v187so37107414wmv.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Dec 2015 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=pbT1Vq4Yd9EteEu1fqotHbey0PHfoCFL1F9sz2duPgw=;
	b=QLfzhWiP13C1MdMw+bn+48vO7aK7bkhAlTEYmALrCsbncCUAj1VUVaVr8Nxg0RA6Or
	e51jf1nsO4SxTl3LmGlw2ZU/pxaxVeX9H+H/8aRc129hIhzChsfkl0kWCNbzeK/zVUsq
	PVvpO00ssVR+U6CZg1ckKuFYaPmvKSbv6ugmUs9i7C4xi7AHXlR+JbSl0X357NqyGObj
	H7meWkl2wJMv5eXTpSTPyFweEv5Y+bg0vLKzpct917DnrHR3CB4dYT8M5ElnmPXaAoHx
	nJTWUchTr28Gz3qQ5TBkNvNyKdj12xFmoAn/PlrUirMjYFrNp1MaFZqaWRr2gx20LBKp
	zBCA==
MIME-Version: 1.0
X-Received: by 10.28.65.213 with SMTP id o204mr40627693wma.83.1449759344564;
	Thu, 10 Dec 2015 06:55:44 -0800 (PST)
Sender: asselsm@gmail.com
Received: by 10.194.59.176 with HTTP; Thu, 10 Dec 2015 06:55:44 -0800 (PST)
In-Reply-To: <A8FC939F80655644A89BB21CCD3741E8011BCDCE58@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <A8FC939F80655644A89BB21CCD3741E8011BCDCE58@G08CNEXMBPEKD02.g08.fujitsu.local>
Date: Thu, 10 Dec 2015 09:55:44 -0500
X-Google-Sender-Auth: k3WK2qOuLvp5SFWlFizd-Ih52bk
Message-ID: <CAPuovELJU9_nEBkP90HjexOctVSfs5Pc72f6FdvdkaKy3hywpQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Dec 2015 14:55:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 3, 2015 at 12:50 AM, Li, Xin <lixin.fnst@cn.fujitsu.com> wrote:
> Hi,all
>
>
>
> When I bitbake python-jsonschema,the error is occurred in the step of
> do_compile as following:
>
>
>
> ------------------------------
>
> DEBUG: Executing shell function do_compile
>
> Download error on https://pypi.python.org/simple/vcversioner/: [Errno -5] No
> address associated with hostname -- Some packages may not be found!
>
> Couldn't find index page for 'vcversioner' (maybe misspelled?)
>
> Download error on https://pypi.python.org/simple/: [Errno -5] No address
> associated with hostname -- Some packages may not be found!
>
> No local packages or download links found for vcversioner
>
> Traceback (most recent call last):
>
>   File "setup.py", line 44, in <module>
>
> vcversioner={"version_module_paths" : ["jsonschema/_version.py"]},
>
> -------------------------------
>
> If you know how to fix it, Please tell me.

A download error during do_compile(). My guess is that we have a
missing dependency. With python, Ruby and some other packages we have
to be careful as their builds will actually cause downloads to happen
if a dependency is missing (python will fetch eggs, ruby will fetch
gems...). When I have time I usually do builds with IP tables rules in
place to force errors when these fetches happen so that I can catch
them and fix them. Downloads should only be done by the fetcher and
not bundler, pdb etc. If you see an error about downloading and you
are not in do_fetch() something is wrong.

Start by adding python-vcversioner as a DEPENDS in python-jsonschema
and you should be good to go.

Mark

>
>
>
> Regards,
>
> li
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

