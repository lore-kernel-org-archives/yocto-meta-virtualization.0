Return-Path: <yanglei.fage@gmail.com>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 759D2E00709
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 06:27:47 -0800 (PST)
Received: by mail-bk0-f42.google.com with SMTP id ji2so8008153bkc.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 06:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=BTxyHQjwHdwIFI2+zMThKjlKAM8mcnNdz74usfHnwFI=;
	b=D6aTOBLaCXVE0BnsoPuvoRfXVMNw4iGYDZg+pTXDCytWD04lM+On2chgX8v5ClF4/H
	RqhQduPZCjMmCw7yZPLm4ICTXo/sFeqj8EHQhvFtjY8Mn7+bYIzYWwLSWv/JcBPo5x3h
	QxrEgfIzwta++8wdWc2ft94E+sNdfSvQin0EpnxTtgl6wDEK8xSQ5ZgCAS87nkTGsjWB
	tXKKUmxHzfX0xkNSpEqNmZwRsL6Vhl6XNVtO1nCXds64+2NrXK1Yg/2cVgynKgs9/2FA
	7oyc3gmXYlldKCkCGY4bAeaWjILaVEZGzYuN9n8Q2HZiGZVJK+5TVOZJDgrStq0bOwDY
	ixaw==
MIME-Version: 1.0
Received: by 10.204.147.141 with SMTP id l13mr28127719bkv.43.1357482466260;
	Sun, 06 Jan 2013 06:27:46 -0800 (PST)
Received: by 10.204.11.86 with HTTP; Sun, 6 Jan 2013 06:27:46 -0800 (PST)
In-Reply-To: <20130106120638.GE3272@jama>
References: <1357460412-11889-1-git-send-email-lei.yang@windriver.com>
	<50E966F7.1040909@gmail.com> <20130106120638.GE3272@jama>
Date: Sun, 6 Jan 2013 06:27:46 -0800
Message-ID: <CAHsH0E-MucE3frDwTAPfowFueesGVQ0n9KckUuAtt98z6XmccQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: meta-virtualization@yoctoproject.org, Joe.MacDonald@windriver.com
Subject: Re: [oe] [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Sun, 06 Jan 2013 14:27:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 6, 2013 at 4:06 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Sun, Jan 06, 2013 at 12:58:47PM +0100, David Nystr=F6m wrote:
>> On 01/06/2013 09:20 AM, lei.yang@windriver.com wrote:
>> > +SECTION =3D "console/network"
>> > +inherit update-alternatives gettext
>> > +
>> > +ALTERNATIVE_${PN} =3D "nc"
>> > +ALTERNATIVE_PRIORITY =3D "100"
>>
>> This means that both versions of netcat have alt. prio 100. what happens
>> when both are installed on the rootfs at the same time. where does the
>> symlink point ?
>
> The one installed later (at least for opkg implementation).
> So it's better to change it to different number.
>

Thanks, I will update this

Lei


> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

