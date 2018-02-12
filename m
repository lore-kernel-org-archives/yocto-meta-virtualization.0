Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE75FE00DE0; Mon, 12 Feb 2018 07:20:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACD1BE00D1C
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Feb 2018 07:20:05 -0800 (PST)
Received: by mail-lf0-f42.google.com with SMTP id x196so20855619lfd.12
	for <meta-virtualization@yoctoproject.org>;
	Mon, 12 Feb 2018 07:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OKsTnNreG8fVnJsOXbFSsfUhmqJ0urYYDzwbY8u4A9k=;
	b=nXGCVrbjmLXLP8z4lejawi0ZjuwR/8HRaUcdOsYAiPUUDIpS11xWTbZfBery4To0yj
	Jl6Xe0NlspSIztHz4HSSDND+aJzKoNM/xLKO9P9HJmwN3IJAN3rUqHzoZNmhjdEWxqoV
	AAVHYbg3BfNAJSlVp0D3fUybW5+7JMksO2apmF+NqXj0twPu+jmEl6BLtc6wmnPkis1T
	xYIcIfoV0TL/+5sGqqE02dOibwfudkRNA/7xCk+Ozy7+/9SpI0S12zfSohWEAapvw0M2
	LEiEaYCcRyHpDQXGjF6NsarYxuGGN3ZerCT9DNCb53J2+0eMKG7EJYxgwiaTgqegbKEH
	eJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OKsTnNreG8fVnJsOXbFSsfUhmqJ0urYYDzwbY8u4A9k=;
	b=autcetBuqlNF7v27q247zNMnYYbJ03rVmhPHyEhHVpAHr9Q2HQUKRBVgOWUqF/A8ot
	FyDThI0G/XCxxSzsyLWZbx1Pa7VztcqYKcBI/g27sRqz1sYL/Lz44GFlgGL3/QrGyK8L
	kl1CNi+pXEci9J+3zPRG4+DTPidqIRBL/wqQeeeJaco7vzELntK3x3PyvlPGK/X7ghe7
	+7KO0DHMh4JJ5MMVWiDIUMp5go813y2ZnEFaN2R7YlIzJ9iIXXDxWf0oUPM7s3SXrr/e
	MFv9M454QdYiH4OPUgxVbm0vieNcaDwrnNkiUTLWZ3USW/1fwrB+R2oTy7fb53B9It4X
	dP6Q==
X-Gm-Message-State: APf1xPBaUiWmKc6IiLTr+AHvOSoYfFz0WQP9IUdgYe7zhbltMf2UyUrb
	0ftsYDlp2Am5fqcOztx+chMVJym55Xp8K3Dr9kvICA==
X-Google-Smtp-Source: AH8x2269LctIy6aqzgje30FFwtPqm1QfeB7MQauKSoZJVLPFKf3JOiVEdsEE7WpuGFr8IP2M1YCZvJxPTcyg7ctyBts=
X-Received: by 10.46.117.3 with SMTP id q3mr8251242ljc.65.1518448804176; Mon,
	12 Feb 2018 07:20:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Mon, 12 Feb 2018 07:20:03 -0800 (PST)
In-Reply-To: <61a38f2a-8aec-95f4-0f3b-6195b3de3cf8@igalia.com>
References: <20180205171306.2201-1-psaavedra@igalia.com>
	<CADkTA4PmEMe9fR8KaAt3s6QhVJ8MSs8DszKxkPtJRJ0+kamU-w@mail.gmail.com>
	<61a38f2a-8aec-95f4-0f3b-6195b3de3cf8@igalia.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 12 Feb 2018 10:20:03 -0500
Message-ID: <CADkTA4Mw5zd_V7OQ5H7GdFd_XiUZHNPqs8=AdDV315YZSXLYxQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Added Yocto recipe for Puppet 4.10.9
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
X-List-Received-Date: Mon, 12 Feb 2018 15:20:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the slow reply, I read this and then promptly forgot to
write an answer!

On Tue, Feb 6, 2018 at 4:31 AM, Pablo Saavedra <psaavedra@igalia.com> wrote=
:
> The current version of the puppet recipe in meta-cloud-services points
> to puppet 3.7.3. This one recipe assumes Ruby 2.2. Since Pyro, Ruby
> 2.4 is being used because Poky includes recipe a 2.4.2 Ruby version in
> its Pyro branch: poky/meta/recipes-devtools/ruby/ruby_2.4.2.bb
>
> The recipe for Puppet 3.7.3 in meta-cloud-services doesn't generate a
> functional agent with Ruby 2.4 and Pyro. In addition, Ruby 2.0 was EOL'd
> February 24th 2016 which means security patch support will end ~Feb 2017.
>

Agreed. We were looking at updating it in the not to distant future, hence =
why
this patch was timely to save that effort.

>
> This recipe is based in the puppet_3.7.3.bb recipe of
> meta-cloud-services. It is basically a upstream upgrade of the recipe.
> During this I also made the cleanup of the already upstreamed patches.
> Only remaining this one:
>
> commit d8d0967a98b256f72e0cc2449d68b4afe23583b2
> Author: YangHaibo <b40869@freescale.com>
> Date:   Wed Dec 3 17:07:56 2014 +0800
>
>     puppet: add recipe for puppet 3.7.3
>
>     A simple demo is added
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>
> The differences and changes respect Puppet 3 and Puppet 4 are highly
> documented in the version 4 release notes [1]. By the way, this patch
> submission was delayed due to unforeseen reasons. Re-thinking about
> this, probably could be a better approaching prepare a recipe for
> 4.10.10 which also includes some additional fixes [2] for a Ruby 2.4
> environment. In other hand, a more formal approaching maybe could be to
> include a Puppet 5 recipe since it is the official Puppet agent version
> with support for Ruby 2.4 [3]. Are you more suitable with this maybe?

I think jumping ahead to Puppet 5 would be ideal, if you think it is doable
from your end (I won't insist, if it puts a lot of extra work on someone el=
se).

>
>
> **Know issues of this patch**:
>
> As I said previously, there is a ambiguous thing using Ruby 2.4 and
> Puppet 4.
> The release notes for Puppet 4 clearly says:
>
>     Ruby: We currently only test and package with 2.1.x
>     versions of Ruby, therefore you should only use this
>     version. Other interpreters and versions of Ruby are
>     not covered by our tests.
>
> ; even when the latest bug-fixes are also fixing errors for Ruby 2.4
> environments.

Agreed .. for these reasons if we can go to puppet 5 that would be
ideal.

At that point, I'll delete the recipe from meta-cloud-services, and until
I hear your thoughts, won't look at any other upgrades to the recipe.

Cheers,

Bruce

>
>
> Regards.
>
> [1]: https://docs.puppet.com/puppet/4.0/release_notes.html
> [2]: https://puppet.com/docs/puppet/4.10/release_notes.html#puppet-4
> [3]: https://tickets.puppetlabs.com/browse/PA-1107
>
> On 06/02/18 02:34, Bruce Ashfield wrote:
>> Hi Pablo,
>>
>> Thanks for the submission .. but I do have a few questions.
>>
>> How does this compare to the other recipes for puppet ? In particular
>> the one in meta-cloud-services, since I'm familiar with it.
>>
>> How has this been tested ? We used to use puppet and chef in
>> meta-cloud-services, so I'd like to log how this has been used as part
>> of the commit.
>>
>> Summary: I'm happy to merge this, I just want to document how it
>> should be used (so I can know if it breaks) and make sure that it is
>> in the right place (so I can delete any other recipes).
>>
>> Cheers,
>>
>> Bruce
>>
>> On Mon, Feb 5, 2018 at 12:13 PM, Pablo Saavedra <psaavedra@igalia.com> w=
rote:
>>> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
>>> ---
>>>  recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++=
++++++++
>>>  1 file changed, 41 insertions(+)
>>>  create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
>>>
>>> diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/=
puppet/puppet_4.10.9.bb
>>> new file mode 100644
>>> index 0000000..a335546
>>> --- /dev/null
>>> +++ b/recipes-support/puppet/puppet_4.10.9.bb
>>> @@ -0,0 +1,41 @@
>>> +SUMMARY =3D "Open source Puppet is a configuration management system"
>>> +HOMEPAGE =3D "https://puppetlabs.com/puppet/puppet-open-source"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7c9045ec00cc0d6b6e0e09ee811=
da4a0"
>>> +
>>> +SRC_URI =3D " \
>>> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>>> +    file://add_puppet_gemspec.patch \
>>> +    file://puppet.conf \
>>> +"
>>> +SRC_URI[md5sum] =3D "8af3c2fec5dc4683d80aab4efc1614c6"
>>> +SRC_URI[sha256sum] =3D "e667bd825e54bbc38c30534c25adc441ed638fc484fe0a=
be278f0335770cd161"
>>> +
>>> +inherit ruby
>>> +
>>> +DEPENDS +=3D " \
>>> +        ruby \
>>> +        facter \
>>> +        hiera \
>>> +"
>>> +
>>> +RDEPENDS_${PN} +=3D " \
>>> +        ruby \
>>> +        facter \
>>> +        hiera \
>>> +        ruby-shadow \
>>> +        bash \
>>> +"
>>> +
>>> +RUBY_INSTALL_GEMS =3D "puppet-${PV}.gem"
>>> +
>>> +do_install_append() {
>>> +    install -d ${D}${sysconfdir}/puppet
>>> +    install -d ${D}${sysconfdir}/puppet/manifests
>>> +    install -d ${D}${sysconfdir}/puppet/modules
>>> +
>>> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
>>> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
>>> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet=
/
>>> +    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
>>> +}
>>> --
>>> 2.11.0
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>
> --
> Pablo Saavedra Rodi=C3=B1o
> psaavedra@igalia.com | Mail
> www.igalia.com       | Web
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

