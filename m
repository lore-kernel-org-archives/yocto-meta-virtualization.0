Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04D53E00D32; Wed, 15 Nov 2017 07:22:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25198E00D28
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 07:22:44 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id x20so9758764ywg.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 07:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6QqnD4WL7IVEOFvdk1/i70MFJL0GwL4HEuTHWtQ06ms=;
	b=fdX0tr91ikPNp5SyaT5gSA69MyKnIqGDgkipZ6ANCQmPr+lMYz4kU4bLMrUTzuoeVM
	wYIZnK7fzJlzD0jZijyXXSfD1HRxq1TyToOFiA7/ogMC2PL+ufEivY4JnQ6fUcZA58wi
	GgE5YA8+pwdmPa1zXbOurwBNEvyaT7yVD0S7iyBoEeYDD8d9azVPoIg8mR54L5+DmRud
	5eCvstblh3qo+oDGDiYomhzwKHu2uZUj37JQ6L1u16/yuyaTrDfJ4JQOHmaAmLD2yzoR
	0F8MaZzGV+Yq2i9AMGjOpURQEcHAjDIfBt+/XZso7mIkzcDD6emOzBmk4TWIFtJ5PC1D
	YCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=6QqnD4WL7IVEOFvdk1/i70MFJL0GwL4HEuTHWtQ06ms=;
	b=cS9nsCUnpdkTC9UpqFcMby9FjcsZ8AeCb6YNMILHgYM00ZjV9PdsKwtMgisfrR0V7x
	NKSufxDqx48zTkQyhfs/zdZtC8tirNKrqY6DbhyeiP3tqRuTJuKWO1adhC8RdvXueYBA
	C3xL4rzgh3EMu7fDzH1u4jp7X9KWdqxLylUqW3eqJa4dun6LYREZdjPBsyoPBv7mJPj5
	/3x5ysrzpTXBM/GTXMgUzrURO2WOswlQQHczdAGcW91A5+WZQGkrEI7YT6Swdw7G30e5
	7v3ka4oI63twXB6hmTUYijZkV96Ei1aZIqAhK0lvoPL0cNfTPeYi1VJ4Qal0uzKu/TM/
	JYpg==
X-Gm-Message-State: AJaThX4dw0/r/DUTxVOItg7I3OyixXsKMSvTWM3SYJPkvvcscF3NeHBI
	YtEbv1IyeupiSca0CPkpElaSi7AAohXPQZ4t4LA=
X-Google-Smtp-Source: AGs4zMaoMFWjHDfriJIC6CHGRjjxSn57TeX4AjUWiBu5DTtr75VU3Xo5pVGJ4cf/zJ2LZXFbv4MAvasqQXbGF03xu/c=
X-Received: by 10.37.199.65 with SMTP id w62mr6636506ybe.514.1510759364042;
	Wed, 15 Nov 2017 07:22:44 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Wed, 15 Nov 2017 07:22:43 -0800 (PST)
In-Reply-To: <CAPuovELn+gRzn3Eqsfr9WB3o_cDRO7VhDAbSPDJSMmSfW1=_kQ@mail.gmail.com>
References: <1510762063-47522-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAPuovELn+gRzn3Eqsfr9WB3o_cDRO7VhDAbSPDJSMmSfW1=_kQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 15 Nov 2017 10:22:43 -0500
X-Google-Sender-Auth: g6rhKBKYucp2YGybdS4PEXVU0mQ
Message-ID: <CAPuovE++iSEvQf+gtfYBUcDbDUp2k5+3k1t0T2VGoJ7T9x3Lig@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-jsonschema: rename to 2.6.0
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
X-List-Received-Date: Wed, 15 Nov 2017 15:22:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 9:39 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Wed, Nov 15, 2017 at 11:07 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
>> Rename python-jsonschema from 2.5.1 to 2.6.0 as it has been upgraded but not renamed.
>
> There is a problem here but there is no version skew as far as I can tell.
>
> From the Pypi site:
> https://pypi.python.org/pypi/jsonschema/2.6.0
>
> Scrolling down to the downloads we can click on the md5sum link for the tarball:
> https://pypi.python.org/pypi?:action=show_md5&digest=50c6b69a373a8b55ff1e0ec6e78f13f4
>
> So the md5sum for 2.6.0 == 50c6b69a373a8b55ff1e0ec6e78f13f4
>
> The md5sum in the recipe is:
> SRC_URI[md5sum] = "e491298485bdefeecb0f1ca3d65e5292"
>
> So clearly not 2.6.0.
>
> Back to Pypi but for version 2.5.1:
> https://pypi.python.org/pypi/jsonschema/2.5.1
>
> And again examine the md5sums for the downloads.
> The md5sum for the zip file matches the md5sum in the recipe
> e491298485bdefeecb0f1ca3d65e5292
>
> So we can either change the md5 and sha256 to match the zip file or
> set PYPI_PACKAGE_EXT to "zip".
>
> What I am less clear about is how my testing of the this recipe's move
> to use the pypi class would have missed this.

Mystery solved. My build was using the 2.6.0 recipe from meta-python.
I will have a look but if the v2.5.1 really isn't needed anymore I
might just drop this recipe from m-c-s. Either way I will follow up
with a change.

Mark

>
> Either way, Bruce, don't merge this patch. I will send you an update.
>
> Thanks Zheng for finding this.
>
> MarkA
>
>>
>> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>  .../python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb}     | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb} (100%)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
>> similarity index 100%
>> rename from meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
>> rename to meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

