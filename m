Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.3276.1579141291717613622
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 18:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.100, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 18:21:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,324,1574150400"; 
   d="scan'208";a="305695905"
Received: from hagiani-mobl1.amr.corp.intel.com ([10.254.108.100])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 18:21:19 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [meta-virtualization][zeus][PATCH 2/2] podman: bump to latest release 1.6.4
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
In-Reply-To: <15EA3791FF24F7E5.21921@lists.yoctoproject.org>
Date: Wed, 15 Jan 2020 18:21:19 -0800
Cc: meta-virtualization@lists.yoctoproject.org,
 Stefan Agner <stefan.agner@toradex.com>
Message-Id: <87AB11DD-7FE3-46E7-97AA-D3389FA61EDE@linux.intel.com>
References: <20200115215414.16007-1-stefan@agner.ch>
 <20200115215414.16007-2-stefan@agner.ch>
 <15EA3791FF24F7E5.21921@lists.yoctoproject.org>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Jan 15, 2020, at 4:47 PM, Tim Orling <timothy.t.orling@linux.intel.co=
m> wrote:
>=20
>=20
>=20
>> On Jan 15, 2020, at 1:54 PM, Stefan Agner <stefan@agner.ch> wrote:
>>=20
>> From: Stefan Agner <stefan.agner@toradex.com>
>>=20
>> Bump to latest podman release 1.6.4. The changelog lists some new
>> features but mostly bugfixes between 1.6.1 and 1.6.4.
>>=20
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Aside from the whitespace errors=E2=80=A6
Thank you for fixing this build, this version was not previously buildable=
 for me probably because of the needed patch.

Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>
Tested-by: Tim Orling <timothy.t.orling@linux.intel.com>

>> ---
>> ...ker-documentation-install-and-genera.patch | 43 +++++++++++++++++++
>> recipes-containers/podman/podman_git.bb       |  7 +--
>> 2 files changed, 47 insertions(+), 3 deletions(-)
>> create mode 100644 recipes-containers/podman/files/0001-Makefile-Fix-do=
cker-documentation-install-and-genera.patch
>=20
> <snip>
>=20
> Whitespace errors:
>=20
> Applying: podman: bump to latest release 1.6.4
> .git/rebase-apply/patch:36: space before tab in indent.
>        $(MAKE) podman-remote-v$(RELEASE_NUMBER)-$*.zip
> .git/rebase-apply/patch:43: space before tab in indent.
>        @echo "Creating changelog from $(CHANGELOG_BASE) to $(CHANGELOG_T=
ARGET)"
> .git/rebase-apply/patch:46: space before tab in indent.
>        install ${SELINUXOPT} -d -m 755 $(DESTDIR)$(BINDIR) $(DESTDIR)$(M=
ANDIR)/man1
> .git/rebase-apply/patch:47: space before tab in indent.
>        install ${SELINUXOPT} -m 755 docker $(DESTDIR)$(BINDIR)/docker
> .git/rebase-apply/patch:52: space before tab in indent.
>        install ${SELINUXOPT} -m 755 -d ${DESTDIR}${SYSTEMDDIR}  ${DESTDI=
R}${USERSYSTEMDDIR} ${DESTDIR}${TMPFILESDIR}
> warning: squelched 1 whitespace error
> warning: 6 lines add whitespace errors.
>=20
>>=20
>> --=20
>> 2.17.1
>>=20
>=20
>=20

