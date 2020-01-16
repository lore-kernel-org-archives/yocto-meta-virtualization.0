Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web10.5663.1579159417237661279
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 23:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=i36gXNyc;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 054FB5C697E;
	Thu, 16 Jan 2020 08:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579159414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=c3fs8MhqfdIQ+ls3b3QW5AszGWMGf5Hq97Sk/zfy4Ps=;
	b=i36gXNycSqHXH5e+5D6qRFQ1iGJV1POLQZYR4IWYnYA8wEkWamh02y5V69VVQ6rdRc9Iwu
	H/E6q4FVJlqenbRKyw9ZvqqYqQyP+ZO0Trpb2ewm3XmdHVyv/TTpfmk76G99JzLs4pp3eE
	Az7QvYF7jtxUGDgcg588d2vOm2t8vr4=
MIME-Version: 1.0
Date: Thu, 16 Jan 2020 08:23:32 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@lists.yoctoproject.org, Stefan Agner
 <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
In-Reply-To: <766854F9-A693-4B71-AF0F-5A6D84CC5861@linux.intel.com>
References: <20200115215414.16007-1-stefan@agner.ch>
 <20200115215414.16007-2-stefan@agner.ch>
 <766854F9-A693-4B71-AF0F-5A6D84CC5861@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <25c34fb12140c6f0429c3d878ceb22a2@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: multipart/alternative;
 boundary="=_25ecb2b29a7e34ff44081c3b5eaba216"

--=_25ecb2b29a7e34ff44081c3b5eaba216
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

Hi Tim, 

On 2020-01-16 01:47, Tim Orling wrote:

>> On Jan 15, 2020, at 1:54 PM, Stefan Agner <stefan@agner.ch> wrote:
>> 
>> From: Stefan Agner <stefan.agner@toradex.com>
>> 
>> Bump to latest podman release 1.6.4. The changelog lists some new
>> features but mostly bugfixes between 1.6.1 and 1.6.4.
>> 
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>> ...ker-documentation-install-and-genera.patch | 43 +++++++++++++++++++
>> recipes-containers/podman/podman_git.bb       |  7 +--
>> 2 files changed, 47 insertions(+), 3 deletions(-)
>> create mode 100644 recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-install-and-genera.patch
> 
> <snip>
> 
> Whitespace errors:
> 
> Applying: podman: bump to latest release 1.6.4
> .git/rebase-apply/patch:36: space before tab in indent.
> $(MAKE) podman-remote-v$(RELEASE_NUMBER)-$*.zip
> .git/rebase-apply/patch:43: space before tab in indent.
> @echo "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_TARGET)"
> .git/rebase-apply/patch:46: space before tab in indent.
> install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
> .git/rebase-apply/patch:47: space before tab in indent.
> install ${SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker
> .git/rebase-apply/patch:52: space before tab in indent.
> install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR}  ${DESTDIR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}
> warning: squelched 1 whitespace error
> warning: 6 lines add whitespace errors.

From what I understand this is in the patch file, where a space is
expected (or actually required...).   

Best regards, 
Stefan

-- 
2.17.1

--=_25ecb2b29a7e34ff44081c3b5eaba216
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3DUTF-8" /></head><body style=3D'font-size: 10pt'>
<p>Hi Tim,</p>
<p id=3D"reply-intro">On 2020-01-16 01:47, Tim Orling wrote:</p>
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">
<div id=3D"replybody1">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;">
<div class=3D"v1ApplePlainTextBody"><br /><br />
<blockquote type=3D"cite" style=3D"padding: 0 0.4em; border-left: #1010ff 2=
px solid; margin: 0">On Jan 15, 2020, at 1:54 PM, Stefan Agner &lt;stefan@a=
gner.ch&gt; wrote:<br /><br />From: Stefan Agner &lt;stefan.agner@toradex=
=2Ecom&gt;<br /><br />Bump to latest podman release 1.6.4. The changelog li=
sts some new<br />features but mostly bugfixes between 1.6.1 and 1.6.4.<br =
/><br />Signed-off-by: Stefan Agner &lt;stefan.agner@toradex.com&gt;<br />-=
--<br />...ker-documentation-install-and-genera.patch | 43 ++++++++++++++++=
+++<br />recipes-containers/podman/podman_git.bb &nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;| &nbsp;7 +--<br />2 files changed, 47 insertions(+), 3 deletions=
(-)<br />create mode 100644 recipes-containers/podman/files/0001-Makefile-F=
ix-docker-documentation-install-and-genera.patch</blockquote>
<br />&lt;snip&gt;<br /><br />Whitespace errors:<br /><br />Applying: podma=
n: bump to latest release 1.6.4<br />.git/rebase-apply/patch:36: space befo=
re tab in indent.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(MAKE) po=
dman-remote-v$(RELEASE_NUMBER)-$*.zip<br />.git/rebase-apply/patch:43: spac=
e before tab in indent.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@ech=
o "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_TARGET)"<br />=
=2Egit/rebase-apply/patch:46: space before tab in indent.<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(B=
INDIR) $(DESTDIR)$(MANDIR)/man1<br />.git/rebase-apply/patch:47: space befo=
re tab in indent.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install ${=
SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker<br />.git/rebase-apply=
/patch:52: space before tab in indent.<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR} &nbsp;${=
DESTDIR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}<br />warning: squelched =
1 whitespace error<br />warning: 6 lines add whitespace errors.</div>
<div class=3D"v1ApplePlainTextBody">&nbsp;</div>
</div>
</div>
</blockquote>
<div id=3D"replybody1">
<div dir=3D"auto" style=3D"word-wrap: break-word; -webkit-nbsp-mode: space;=
 line-break: after-white-space;">
<div class=3D"v1ApplePlainTextBody">&nbsp;</div>
<div class=3D"v1ApplePlainTextBody">From what I understand this is in the p=
atch file, where a space is expected (or actually required...).&nbsp;&nbsp;=
</div>
<div class=3D"v1ApplePlainTextBody">&nbsp;</div>
<div class=3D"v1ApplePlainTextBody">Best regards,</div>
<div class=3D"v1ApplePlainTextBody">Stefan<br /><br /><br />-- <br />2.17=
=2E1<br /><br /><br /></div>
</div>
</div>
<p><br /></p>

</body></html>

--=_25ecb2b29a7e34ff44081c3b5eaba216--
