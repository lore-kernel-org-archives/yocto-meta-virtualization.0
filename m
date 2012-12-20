Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1FBA1E0045D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Dec 2012 03:56:21 -0800 (PST)
Received: from [172.16.140.28] (172.16.140.28) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1;
	Thu, 20 Dec 2012 12:56:21 +0100
Message-ID: <50D2FCD7.3080307@enea.com>
Date: Thu, 20 Dec 2012 12:56:07 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1355841118-22361-1-git-send-email-david.nystrom@enea.com>
	<1355841118-22361-16-git-send-email-david.nystrom@enea.com>
	<CADkTA4OYWLAP0X5iowhK35=xtsmptK-xyAuGsBS5K-hp6dq7dQ@mail.gmail.com>
In-Reply-To: <CADkTA4OYWLAP0X5iowhK35=xtsmptK-xyAuGsBS5K-hp6dq7dQ@mail.gmail.com>
X-Originating-IP: [172.16.140.28]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	"raymond.danks@se-eng.com" <raymond.danks@se-eng.com>
Subject: Re: [RFC][PATCH 15/16] Added python-quantumclient recipe
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
X-List-Received-Date: Thu, 20 Dec 2012 11:56:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable


On 12/18/2012 03:40 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Dec 18, 2012 at 9:31 AM, David Nystr=F6m <david.c.nystrom@gmail.c=
om
> <mailto:david.c.nystrom@gmail.com>> wrote:
>
>      Signed-off-by: David Nystr=F6m <david.nystrom@enea.com
>      <mailto:david.nystrom@enea.com>>
>      ---
>        .../quantumclient/python-quantumclient_git.bb
>      <http://python-quantumclient_git.bb>      |   23 +++++++++++++++++++=
+
>        1 file changed, 23 insertions(+)
>        create mode 100644 recipes-cloud/quantumclient/python-quantumclien=
t_git.bb
>      <http://python-quantumclient_git.bb>
>
>      diff --git a/recipes-cloud/quantumclient/python-quantumclient_git.bb
>      <http://python-quantumclient_git.bb>
>      b/recipes-cloud/quantumclient/python-quantumclient_git.bb
>      <http://python-quantumclient_git.bb>
>      new file mode 100644
>      index 0000000..bb0aae6
>      --- /dev/null
>      +++ b/recipes-cloud/quantumclient/python-quantumclient_git.bb
>      <http://python-quantumclient_git.bb>
>      @@ -0,0 +1,23 @@
>      +DESCRIPTION =3D "This is the client API library for Quantum."
>      +SECTION =3D "devel/python"
>      +LICENSE =3D "Apache-2"
>      +PR =3D "0"
>      +
>      +RDEPENDS_${PN} =3D "python-pyparsing \
>      +          python-simplejson \
>      +          python-httplib2 \
>      +          python-prettytable \
>      +          python-cliff \
>      +          "
>      +
>      +SRCREV =3D "bc7ba5e19d4e9039146ca37f77a0b232522cddc8"
>      +PV =3D "0.2.1+gitr${SRCREV}"
>
>
> I haven't checked yet (swamped by email at the moment), but is the SRCREV
> you have listed the tag/branch for 0.2.1 ?
>

Yes, it is.

> If it is, we've been using: PV =3D "<version>", since adding the gitr + S=
RCREV
> doesn't add any value on top of the version number.
>

Agree, will fix in whole patchset.

> (same question/comment applies to the other client python routines).
>
> Cheers,
>
> Bruce
>
>
>      +SRC_URI =3D
>      "git://github.com/openstack/python-quantumclient.git;protocol=3Dhttp=
s
>      <http://github.com/openstack/python-quantumclient.git;protocol=3Dhtt=
ps>"
>      +S =3D "${WORKDIR}/git"
>      +
>      +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1dece7821bf3fd70fe1309ea=
a37d52a2"
>      +
>      +export BUILD_SYS
>      +export HOST_SYS
>      +
>      +inherit setuptools
>      \ No newline at end of file
>      --
>      1.7.9.5
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its
> end"
>

