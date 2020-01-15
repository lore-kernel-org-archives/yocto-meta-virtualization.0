Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web11.1326.1579121189503770612
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 12:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=gLcA0wc4;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7F6B55C680D;
	Wed, 15 Jan 2020 21:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579121186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rQLBHrFTq9KGmNIzUlIwuzslP5BTX7bpbO+KKOX7xbs=;
	b=gLcA0wc4YK9aFRTf5vt7RmG7H1chFq/OnSuTb9ciSJ0nFhSoeCNb+tbcKmXKExTBvnQ5Ob
	Vo1ukULirWohth9EbKrHj0Vfzy+Xc444ne9vQs1fdQcYOKpqSbIBJLsgKdLaR5pZru1kp+
	mj16F+gt+n+Wp0A/ihFuduu4l0hnzaI=
MIME-Version: 1.0
Date: Wed, 15 Jan 2020 21:46:25 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Stefan Agner
 <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH] docker-ce: update to v19.03.5
In-Reply-To: <CADkTA4NXM2zakdsv1JsmuzW-s-3jHKK=nx65LT_uvuuxKwuM-w@mail.gmail.com>
References: <20200109151533.16876-1-stefan@agner.ch>
 <CADkTA4NXM2zakdsv1JsmuzW-s-3jHKK=nx65LT_uvuuxKwuM-w@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <c4d8c75e7364402195eb6f881a2a3cd3@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

No problem, not really urgent from my side.

I also have some podman updates I am working on, will probably send
soon.

--
Stefan

On 2020-01-15 20:26, Bruce Ashfield wrote:
> Sorry for the delays on this. I'm working through some kernel issues.
> I do expect to have this merged in the next couple of days (I just
> want to sync moby, and run some tests first).
> 
> Bruce
> 
> On Thu, Jan 9, 2020 at 10:15 AM Stefan Agner <stefan@agner.ch> wrote:
>>
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Bump the git hashes to Docker CE v19.03.5. This requires to get the
>> docker daemon binary from a different location as the symlink from
>> the latest/ subdirectory has been removed. See also commit deaac5d4b3fa
>> ("hack/make.sh remove "latest" symlink") in the docker-ce repository.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
>>  recipes-containers/docker/docker-ce_git.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-containers/docker/docker-ce_git.bb b/recipes-containers/docker/docker-ce_git.bb
>> index 817795f..0d088da 100644
>> --- a/recipes-containers/docker/docker-ce_git.bb
>> +++ b/recipes-containers/docker/docker-ce_git.bb
>> @@ -18,7 +18,7 @@ DESCRIPTION = "Linux container runtime \
>>   subtle and/or glaring issues. \
>>   "
>>
>> -SRCREV_docker = "6a30dfca03664a0b6bf0646a7d389ee7d0318e6e"
>> +SRCREV_docker = "633a0ea838f10e000b7c6d6eed1623e6e988b5bb"
>>  SRCREV_libnetwork = "5ac07abef4eee176423fdc1b870d435258e2d381"
>>  SRC_URI = "\
>>         git://github.com/docker/docker-ce.git;branch=19.03;name=docker \
>> @@ -38,7 +38,7 @@ GO_IMPORT = "import"
>>
>>  S = "${WORKDIR}/git"
>>
>> -DOCKER_VERSION = "19.03.2-ce"
>> +DOCKER_VERSION = "19.03.5-ce"
>>  PV = "${DOCKER_VERSION}+git${SRCREV_docker}"
>>
>>  PACKAGES =+ "${PN}-contrib"
>> @@ -99,7 +99,7 @@ do_compile() {
>>  do_install() {
>>         mkdir -p ${D}/${bindir}
>>         cp ${S}/src/import/components/cli/build/docker ${D}/${bindir}/docker
>> -       cp ${S}/src/import/components/engine/bundles/latest/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>> +       cp ${S}/src/import/components/engine/bundles/dynbinary-daemon/dockerd ${D}/${bindir}/dockerd
>>         cp ${WORKDIR}/git/libnetwork/bin/docker-proxy* ${D}/${bindir}/docker-proxy
>>
>>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> --
>> 2.17.1
>>
>> 
