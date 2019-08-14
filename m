Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84A1BE00DA4; Tue, 13 Aug 2019 20:17:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4DFCE00C81
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 20:17:07 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id c9so78195640lfh.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Aug 2019 20:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fMyyGjEA5ZxF9P+L7UH4KuZmHDn5zEEGjMABdSCI7bA=;
	b=nnQjXuQjDI5/u9OR2AC7cQ4QRHt80nL5AFVHJWSn6wkvJT1xJeltmBHhubPYqrot+N
	VOJ6YOeDqc3VZwPR6EKUn3Tgm/z/QU3K2hvlSj4UTjlPR8fZ/yciWNTHx3nUokZeZGAQ
	ZbQyCVBpP7kXHZWN09BDuSpr2rqIxO0RPLSZ+bYCbF3Hql10uhEacqru8/TH9TnqCWAP
	9Nve4H04YVe5auJEyXxITX+9obbLSowZrCv/CuUlQlfPugU1wAG7w6nDYIFLtv2x2sIC
	pkqZRx6CAzS5hQqIer7cpzXAFPh3useaoGQxKlUip6QPES58gfatMfYRzvZVqa6OrILP
	nOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fMyyGjEA5ZxF9P+L7UH4KuZmHDn5zEEGjMABdSCI7bA=;
	b=WpnEUYIwCq+aZK3uQcf7PxFAMaO5tskDU4rfFmUBgwKrrZU15qqgQakLdEZLO0rCrd
	QUU/GWAuIAkRKanKQzqOeDM7Jf7EsobJoICTmrBNHTg9JguBjbeUeBdyqCxcLpBDe+wi
	lISxsbjnM5o9YGpXfhxfeygsJAvbtK0Kvt5cyIt+ZPjMxORekXrr7xs8EJmy0JH+HF7o
	BCEPIytgryq5Q0gn30fEUma7V1ng1LJclcxlZj123VNhYHWplTAHhjRL1yOol41z653D
	XyosvAI8fcJkaO+C0iJ9mVdeATkHsU6C4C7udwrq+qFLE+KbNoSHZz59zV76aO5vmBCt
	KZag==
X-Gm-Message-State: APjAAAW5pHXW4Apm+Mlea0D8yi8WYfCXimD7pFnmQVzBV0YJWJdTcVOb
	wq0H9iQMde/JtJDNVqwwmZ83BrkUVFsY1rpYbk0=
X-Google-Smtp-Source: APXvYqywmQrl8Os3PmKxRaoXbCUIE6lTL9QuZs65Bz7GFFhXD9IBUREcgpSG0g1dsASWvebOqbJr/xuAohgEXjLBY98=
X-Received: by 2002:a19:110:: with SMTP id 16mr24814091lfb.63.1565752626028;
	Tue, 13 Aug 2019 20:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190813075136.6248-1-Qi.Chen@windriver.com>
	<CADkTA4OM9sYbf-dZnXs0A4-Efjg9bj3MbPar9bS=3W8eDEiBhA@mail.gmail.com>
	<ed258dd7-e3bb-4b87-e598-be38917c1762@windriver.com>
In-Reply-To: <ed258dd7-e3bb-4b87-e598-be38917c1762@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 13 Aug 2019 23:16:54 -0400
Message-ID: <CADkTA4Pzg+CmWjFb9fCugoApYY4YhALYE4WAD2o-srKj=M2OLQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/4] cni: add 0.7.1 for cni and 0.7.5 for plugins
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
X-List-Received-Date: Wed, 14 Aug 2019 03:17:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2019 at 9:28 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 08/13/2019 08:31 PM, Bruce Ashfield wrote:
>
>
>
> On Tue, Aug 13, 2019 at 3:52 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>>
>> This version is proved to work well for simple k8s flannel setup.
>>
>
> Nope. We have no reason to use version locked recipes for this. I want on=
e version for the layer, not a _git and a versioned set of plugins.
>
> Upgrade the main _cni plugin to the latest version, make sure it works wi=
th kubernetes and that's the version we'll use.
>
>
> I've replied in another email what problem is with the current version of=
  cni. Hope you can reproduce it on your side.
>
> Apart form this, I have several questions, and I hope to hear your opinio=
n.
>
> 1. Docker version with k8s
>     I've seen warnings from k8s telling me that the current docker versio=
n is not supported/validated upstream. Do you think it's a problem? From wh=
at I know, k8s team is not very interested in validating latest docker.


I've never had any issues with using the latest Docker and k8s. Since
there's much more to the container world than kubernetes, it can't
dictate our version of docker. I'm also not willing to create frozen
versions for all of the projects that may have not tested/validated
with a particular version of docker. The frozen versions are a
maintenance nightmare, they'll bitrot and become security issues.

Our integration and testing with meta-virt is where we make sure that
our latest Docker version meets the needs of the projects, so we don't
need the upstream's project to validate our version. We are like any
other OS in that sense.

>
>
> 2. Docker upstream
>     We are currently using moby. There's another recipe called docker-ce,=
 making use of docker-ce repo. Ubuntu is using docker-ce. I did a little in=
vestigation. Moby is actually the community version while docker-ce is main=
tained by Docker Inc. Do you think we should do something about it? Which o=
ne should we prefer? moby or docker-ce?


moby is the default, but I've always maintained a docker-ce recipe for
people that really want to follow that "docker the company" is pushing
out as a stamped version. But that curated version isn't truly the
upstream project. We don't want to follow what the corporation
blesses, we want the community version for a small/tight/new
integratino. We are consuming the bits directly via moby, and hence
can control exactly what we need.

For distros that want docker-ce, they can use the recipe in their
package lists that they need.

I logged this in the docker recipe itself:

#   - This could be called "docker-moby" or just "moby" in the future, but
#     that would require the creation of a virtual/docker dependency, which
#     is possible, but overkill at the moment (while we wait for the upstre=
am
#     to stop changing).

I likely won't make that change for the fall release, but was planning
on doing it for the spring.

>
>
> 3. k8s version
>     The current version is not the latest stable version (1.15.2). I hope=
 this 1.16 version would come be released stable, but we cannot control it.=
 Do you think we should have a stable version of k8s?

With the rate of change of kubernetes and the small support window of
meta-virt, following a stable doesn't make sense at this point.
Tracking the tip/latest is what we do. Just like we do with the
reference kernels.  If there are every truly LTS kubernetes releases,
it could be reconsidered, but keeping more than one version around is
a version/maintenance issue. So going with the latest and greatest is
the best bet.

>
> From what I know, OE's policy is using stable version unless there's some=
 compelling reason. All these container/k8s things are being actively devel=
oped, and that could be a reason. But should we also have some stable versi=
ons? I don't think users would like to use unstable version in their produc=
tion environment.
>

The definition of stable varies per project. There's nothing
particularly stable about any given release, so putting cycles into an
older version and claiming it is stable is a false sense of security
for anyone using it.

Bruce

> Best Regards,
> Chen Qi
>
>
> Cheers,
>
> Bruce
>
>
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  recipes-networking/cni/cni_0.7.1.bb | 79 +++++++++++++++++++++++++++++
>>  1 file changed, 79 insertions(+)
>>  create mode 100644 recipes-networking/cni/cni_0.7.1.bb
>>
>> diff --git a/recipes-networking/cni/cni_0.7.1.bb b/recipes-networking/cn=
i/cni_0.7.1.bb
>> new file mode 100644
>> index 0000000..7a3b87f
>> --- /dev/null
>> +++ b/recipes-networking/cni/cni_0.7.1.bb
>> @@ -0,0 +1,79 @@
>> +HOMEPAGE =3D "https://github.com/containernetworking/cni"
>> +SUMMARY =3D "Container Network Interface - networking for Linux contain=
ers"
>> +DESCRIPTION =3D "CNI (Container Network Interface), a Cloud Native Comp=
uting \
>> +Foundation project, consists of a specification and libraries for writi=
ng \
>> +plugins to configure network interfaces in Linux containers, along with=
 a \
>> +number of supported plugins. CNI concerns itself only with network conn=
ectivity \
>> +of containers and removing allocated resources when the container is de=
leted. \
>> +Because of this focus, CNI has a wide range of support and the specific=
ation \
>> +is simple to implement. \
>> +"
>> +
>> +# 0.7.1
>> +SRCREV_cni =3D "4cfb7b568922a3c79a23e438dc52fe537fc9687e"
>> +# 0.7.5
>> +SRCREV_plugins =3D "a62711a5da7a2dc2eb93eac47e103738ad923fd6"
>> +SRC_URI =3D "\
>> +       git://github.com/containernetworking/cni.git;branch=3Dmaster;nam=
e=3Dcni \
>> +        git://github.com/containernetworking/plugins.git;branch=3Dv0.7;=
destsuffix=3Dplugins;name=3Dplugins \
>> +       "
>> +
>> +RPROVIDES_${PN} +=3D "kubernetes-cni"
>> +
>> +LICENSE =3D "Apache-2.0"
>> +LIC_FILES_CHKSUM =3D "file://src/import/LICENSE;md5=3Dfa818a259cbed7ce8=
bc2a22d35a464fc"
>> +
>> +GO_IMPORT =3D "import"
>> +
>> +PV =3D "0.7.1"
>> +
>> +inherit go
>> +inherit goarch
>> +
>> +do_compile() {
>> +       # link fixups for compilation
>> +       rm -f ${S}/src/import/vendor/src
>> +       mkdir -p ${S}/src/import/vendor/
>> +       ln -sf ./ ${S}/src/import/vendor/src
>> +       rm -rf ${S}/src/import/plugins
>> +       rm -rf ${S}/src/import/vendor/github.com/containernetworking/plu=
gins
>> +
>> +       mkdir -p ${S}/src/import/vendor/github.com/containernetworking/c=
ni
>> +
>> +       ln -sf ../../../../libcni ${S}/src/import/vendor/github.com/cont=
ainernetworking/cni/libcni
>> +       ln -sf ../../../../pkg ${S}/src/import/vendor/github.com/contain=
ernetworking/cni/pkg
>> +       ln -sf ../../../../cnitool ${S}/src/import/vendor/github.com/con=
tainernetworking/cni/cnitool
>> +       ln -sf ${WORKDIR}/plugins ${S}/src/import/vendor/github.com/cont=
ainernetworking/plugins
>> +
>> +       export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:=
${STAGING_DIR_TARGET}/${prefix}/local/go"
>> +       export CGO_ENABLED=3D"1"
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/cni/lib=
cni
>> +       ${GO} build
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/cni/cni=
tool
>> +       ${GO} build
>> +
>> +       cd ${S}/src/import/vendor/github.com/containernetworking/plugins=
/
>> +       PLUGINS=3D"$(ls -d plugins/meta/*; ls -d plugins/ipam/*; ls -d p=
lugins/main/* | grep -v windows)"
>> +       mkdir -p ${WORKDIR}/plugins/bin/
>> +       for p in $PLUGINS; do
>> +           plugin=3D"$(basename "$p")"
>> +           echo "building: $p"
>> +           ${GO} build -o ${WORKDIR}/plugins/bin/$plugin github.com/con=
tainernetworking/plugins/$p
>> +       done
>> +}
>> +
>> +do_install() {
>> +    localbindir=3D"/opt/cni/bin"
>> +
>> +    install -d ${D}${localbindir}
>> +    install -d ${D}/${sysconfdir}/cni/net.d
>> +
>> +    install -m 755 ${S}/src/import/cnitool/cnitool ${D}/${localbindir}
>> +    install -m 755 -D ${WORKDIR}/plugins/bin/* ${D}/${localbindir}
>> +}
>> +
>> +FILES_${PN} +=3D "/opt/cni/bin/*"
>> +
>> +INSANE_SKIP_${PN} +=3D "ldflags already-stripped"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

