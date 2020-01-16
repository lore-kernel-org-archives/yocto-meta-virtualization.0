Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.2314.1579135719124641429
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 16:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.20, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 16:48:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; 
   d="scan'208,217";a="213898008"
Received: from hagiani-mobl1.amr.corp.intel.com ([10.254.108.100])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 16:48:38 -0800
Subject: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
X-Apple-Base-Url: x-msg://13/
In-Reply-To: <20200115215414.16007-2-stefan@agner.ch>
X-Apple-Windows-Friendly: 1
Date: Wed, 15 Jan 2020 16:47:07 -0800
Cc: meta-virtualization@lists.yoctoproject.org,
 Stefan Agner <stefan.agner@toradex.com>
X-Apple-Mail-Signature: SKIP_SIGNATURE
Message-Id: <766854F9-A693-4B71-AF0F-5A6D84CC5861@linux.intel.com>
References: <20200115215414.16007-1-stefan@agner.ch>
 <20200115215414.16007-2-stefan@agner.ch>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Type: text/html;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div =
class=3D"ApplePlainTextBody"><br><br><blockquote type=3D"cite">On Jan =
15, 2020, at 1:54 PM, Stefan Agner &lt;stefan@agner.ch&gt; =
wrote:<br><br>From: Stefan Agner =
&lt;stefan.agner@toradex.com&gt;<br><br>Bump to latest podman release =
1.6.4. The changelog lists some new<br>features but mostly bugfixes =
between 1.6.1 and 1.6.4.<br><br>Signed-off-by: Stefan Agner =
&lt;stefan.agner@toradex.com&gt;<br>---<br>...ker-documentation-install-an=
d-genera.patch | 43 =
+++++++++++++++++++<br>recipes-containers/podman/podman_git.bb =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;7 +--<br>2 files changed, 47 =
insertions(+), 3 deletions(-)<br>create mode 100644 =
recipes-containers/podman/files/0001-Makefile-Fix-docker-documentation-ins=
tall-and-genera.patch<br></blockquote><br>&lt;snip&gt;<br><br>Whitespace =
errors:<br><br>Applying: podman: bump to latest release =
1.6.4<br>.git/rebase-apply/patch:36: space before tab in indent.<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$(MAKE) =
podman-remote-v$(RELEASE_NUMBER)-$*.zip<br>.git/rebase-apply/patch:43: =
space before tab in indent.<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@echo "Creating changelog from =
$(CHANGELOG_BASE) to $(CHANGELOG_TARGET)"<br>.git/rebase-apply/patch:46: =
space before tab in indent.<br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install ${SELINUXOPT} -d -m =
755 $(DESTDIR)$(BINDIR) =
$(DESTDIR)$(MANDIR)/man1<br>.git/rebase-apply/patch:47: space before tab =
in indent.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install =
${SELINUXOPT} -m 755 docker =
$(DESTDIR)$(BINDIR)/docker<br>.git/rebase-apply/patch:52: space before =
tab in indent.<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;install =
${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR} =
&nbsp;${DESTDIR}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}<br>warning: =
squelched 1 whitespace error<br>warning: 6 lines add whitespace =
errors.<br><br><blockquote type=3D"cite"><br>-- =
<br>2.17.1<br><br></blockquote><br></div></body></html>=
