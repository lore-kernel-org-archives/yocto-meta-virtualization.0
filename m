Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 by mx.groups.io with SMTP id smtpd.web12.212.1579299472982874722
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jan 2020 14:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agner.ch header.s=dkim header.b=y6STbYIi;
 spf=pass (domain: agner.ch, ip: 178.209.48.109, mailfrom: stefan@agner.ch)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 7019D5C7912;
	Fri, 17 Jan 2020 23:17:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1579299469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIU2+BMC1i2kfTKECX9qFP4ky5DQBGzh+JiYLtmB+Hk=;
	b=y6STbYIi/pOIGZ6CkimcQJ//zGpJchsFOJ6Ch3lVKKPcdYs8WPOHvQD0epn2chT8kPNyQ+
	M2gVLrg78zqgZo2XlMWZqwaAGSJYYES/cQVwpVP2b3O3uj0MVyOHEJ3AWYUjBcPZ35hd1d
	TmSxzpzWTND2Jw7BePQtlkFvM1BRv8E=
MIME-Version: 1.0
Date: Fri, 17 Jan 2020 23:17:49 +0100
From: "Stefan Agner" <stefan@agner.ch>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Stefan Agner
 <stefan.agner@toradex.com>
Subject: Re: [meta-virtualization][PATCH] docker-ce: update to v19.03.5
In-Reply-To: <CADkTA4M+N=W9-pAAajhYYjxFbFV1GY+pvYZnweFsivzKbhgrQg@mail.gmail.com>
References: <20200109151533.16876-1-stefan@agner.ch>
 <CADkTA4M+N=W9-pAAajhYYjxFbFV1GY+pvYZnweFsivzKbhgrQg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <3ceef214538b569b6e8bd679076b669f@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2020-01-17 22:30, Bruce Ashfield wrote:
> Similar to the podman patches, I've merged this to master.
> 
> But I'm not really seeing a compelling security or serious bug fix
> that makes it something I'd want to also apply to Zeus.

There is a security fix listed in the release notes (CVE-2017-18367),
but I think it does not apply since we do not build runc from docker-ce
repository, so I agree there is no serious security issue fixed which
would warrant the update.

There were two bug fixes which caught my attention:
- Docker 19.03 doesn't support OCI image #39727
- Fix panic on 32-bit ARMv7 caused by misaligned struct member.
docker/engine#363

I haven't hit either one of them. But not supporting OCI image standard
sounds uncool, and we run an ARMv7 so quite likely we would hit that one
sooner or later.

So I probably will go for the update in our distro.

--
Stefan


> 
> Again, I'm open to being convinced.
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
