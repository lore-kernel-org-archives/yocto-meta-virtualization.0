Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.5671.1579159553915553183
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 23:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@agner.ch header.s=dkim header.b=ujTH8HWw;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 358D05C068B;
	Thu, 16 Jan 2020 08:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579159552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMrsA7YCKKJA6s1vQ7EQY9QAoe4qInpQCXfpPPVmQ1Q=;
	b=ujTH8HWwGUIxHqU/jPeB8CMJnd5/ttSSmI8B2NdSHXwFebhM7ZbMwYKVG24aLgd24YKo4V
	GbbFjRhWaPEOORDpWit90KdyxdTt7vh2etztea2W27ftk/OpPIv5eN/35PALAsipAZGbIe
	YBtXCibfSKq9t8/x/gESV3NLZSFGH0o=
MIME-Version: 1.0
Date: Thu, 16 Jan 2020 08:25:52 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@lists.yoctoproject.org, Stefan Agner
 <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
In-Reply-To: <87AB11DD-7FE3-46E7-97AA-D3389FA61EDE@linux.intel.com>
References: <20200115215414.16007-1-stefan@agner.ch>
 <20200115215414.16007-2-stefan@agner.ch>
 <15EA3791FF24F7E5.21921@lists.yoctoproject.org>
 <87AB11DD-7FE3-46E7-97AA-D3389FA61EDE@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <778ec9ebe7157be64208d54fb001a43e@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2020-01-16 03:21, Tim Orling wrote:
>> On Jan 15, 2020, at 4:47 PM, Tim Orling <timothy.t.orling@linux.intel.c=
om> wrote:
>>
>>
>>
>>> On Jan 15, 2020, at 1:54 PM, Stefan Agner <stefan@agner.ch> wrote:
>>>
>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>
>>> Bump to latest podman release 1.6.4. The changelog lists some new
>>> features but mostly bugfixes between 1.6.1 and 1.6.4.
>>>
>>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>=20
> Aside from the whitespace errors=E2=80=A6

See comment in reply to the other email.

> Thank you for fixing this build, this version was not previously
> buildable for me probably because of the needed patch.
>=20
> Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>
> Tested-by: Tim Orling <timothy.t.orling@linux.intel.com>
>=20

Yes, after the patch things started to work here. FWIW, I also tested
this on actual hardware, that is where I realized I also have to update
conman...

Thanks for testing!

--
Stefan


>>> ---
>>> ...ker-documentation-install-and-genera.patch | 43 +++++++++++++++++++
>>> recipes-containers/podman/podman_git.bb       |  7 +--
>>> 2 files changed, 47 insertions(+), 3 deletions(-)
>>> create mode 100644 recipes-containers/podman/files/0001-Makefile-Fix-d=
ocker-documentation-install-and-genera.patch
>>
>> <snip>
>>
>> Whitespace errors:
>>
>> Applying: podman: bump to latest release 1.6.4
>> .git/rebase-apply/patch:36: space before tab in indent.
>>        $(MAKE) podman-remote-v$(RELEASE_NUMBER)-$*.zip
>> .git/rebase-apply/patch:43: space before tab in indent.
>>        @echo "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_=
TARGET)"
>> .git/rebase-apply/patch:46: space before tab in indent.
>>        install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(=
MANDIR)/man1
>> .git/rebase-apply/patch:47: space before tab in indent.
>>        install ${SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker
>> .git/rebase-apply/patch:52: space before tab in indent.
>>        install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR}  ${DESTD=
IR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}
>> warning: squelched 1 whitespace error
>> warning: 6 lines add whitespace errors.
>>
>>>
>>> --
>>> 2.17.1
>>>
>>
>>=20
