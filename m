Return-Path: <psaavedra@igalia.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27189E00DB7; Tue,  6 Feb 2018 01:31:39 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C493AE00D32
	for <meta-virtualization@yoctoproject.org>;
	Tue,  6 Feb 2018 01:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=IIKD1Lc8qcBv8hclUs3rGhLd99ylqCzCbEiri/f/tak=; 
	b=gfwAugltRFWuerCXC3ByuRHFDuz7oA3FlSt4cBhoBqyLBljAyZjlzKJXIm6Dsj1NPGytZlDOCmRabaGs9cnVCPOqvTfKfn5iNT0+LQ2IILepG5XAD8HA9YXu9Ja27TYXTiYJ701dz3O6o/LVIJv0OxeZgBm36ww64mt52QiFvatooKkXcg5KuydhICaXwjq6SJvXAA3Ol1p3EVMhRicCgbgYZDr+ETuAcD8LDtPtFyzrKjHMujkz7FW3IpsqYKs8JsmB06acsGYHBh7ThOvPMmons24ngEAizIOzXTq/quZJ4VMc273JuCUoEH50/6x5Un5DBlSpXC0cHeoUoh1Z5g==;
Received: from [192.168.10.146] by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1eizbC-0006OV-19; Tue, 06 Feb 2018 10:31:34 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180205171306.2201-1-psaavedra@igalia.com>
	<CADkTA4PmEMe9fR8KaAt3s6QhVJ8MSs8DszKxkPtJRJ0+kamU-w@mail.gmail.com>
From: Pablo Saavedra <psaavedra@igalia.com>
Message-ID: <61a38f2a-8aec-95f4-0f3b-6195b3de3cf8@igalia.com>
Date: Tue, 6 Feb 2018 10:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PmEMe9fR8KaAt3s6QhVJ8MSs8DszKxkPtJRJ0+kamU-w@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Feb 2018 09:31:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

The current version of the puppet recipe in meta-cloud-services points
to puppet 3.7.3. This one recipe assumes Ruby ​​2.2. Since Pyro, Ruby
​​2.4 is being used because Poky includes recipe a 2.4.2 Ruby version in
its Pyro branch: poky/meta/recipes-devtools/ruby​​/ruby_2.4.2.bb

The recipe for Puppet 3.7.3 in meta-cloud-services doesn't generate a
functional agent with Ruby 2.4 and Pyro. In addition, Ruby 2.0 was EOL'd
February 24th 2016 which means security patch support will end ~Feb 2017.


This recipe is based in the puppet_3.7.3.bb recipe of
meta-cloud-services. It is basically a upstream upgrade of the recipe.
During this I also made the cleanup of the already upstreamed patches.
Only remaining this one:

commit d8d0967a98b256f72e0cc2449d68b4afe23583b2
Author: YangHaibo <b40869@freescale.com>
Date:   Wed Dec 3 17:07:56 2014 +0800

    puppet: add recipe for puppet 3.7.3
   
    A simple demo is added
   
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


The differences and changes respect Puppet 3 and Puppet 4 are highly
documented in the version 4 release notes [1]. By the way, this patch
submission was delayed due to unforeseen reasons. Re-thinking about
this, probably could be a better approaching prepare a recipe for
4.10.10 which also includes some additional fixes [2] for a Ruby 2.4
environment. In other hand, a more formal approaching maybe could be to
include a Puppet 5 recipe since it is the official Puppet agent version
with support for Ruby 2.4 [3]. Are you more suitable with this maybe?


**Know issues of this patch**:

As I said previously, there is a ambiguous thing using Ruby 2.4 and
Puppet 4.
The release notes for Puppet 4 clearly says:

    Ruby: We currently only test and package with 2.1.x
    versions of Ruby, therefore you should only use this
    version. Other interpreters and versions of Ruby are
    not covered by our tests.

; even when the latest bug-fixes are also fixing errors for Ruby 2.4
environments.


Regards.

[1]: https://docs.puppet.com/puppet/4.0/release_notes.html
[2]: https://puppet.com/docs/puppet/4.10/release_notes.html#puppet-4
[3]: https://tickets.puppetlabs.com/browse/PA-1107

On 06/02/18 02:34, Bruce Ashfield wrote:
> Hi Pablo,
>
> Thanks for the submission .. but I do have a few questions.
>
> How does this compare to the other recipes for puppet ? In particular
> the one in meta-cloud-services, since I'm familiar with it.
>
> How has this been tested ? We used to use puppet and chef in
> meta-cloud-services, so I'd like to log how this has been used as part
> of the commit.
>
> Summary: I'm happy to merge this, I just want to document how it
> should be used (so I can know if it breaks) and make sure that it is
> in the right place (so I can delete any other recipes).
>
> Cheers,
>
> Bruce
>
> On Mon, Feb 5, 2018 at 12:13 PM, Pablo Saavedra <psaavedra@igalia.com> wrote:
>> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
>> ---
>>  recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>  create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
>>
>> diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
>> new file mode 100644
>> index 0000000..a335546
>> --- /dev/null
>> +++ b/recipes-support/puppet/puppet_4.10.9.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY = "Open source Puppet is a configuration management system"
>> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
>> +
>> +SRC_URI = " \
>> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>> +    file://add_puppet_gemspec.patch \
>> +    file://puppet.conf \
>> +"
>> +SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
>> +SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
>> +
>> +inherit ruby
>> +
>> +DEPENDS += " \
>> +        ruby \
>> +        facter \
>> +        hiera \
>> +"
>> +
>> +RDEPENDS_${PN} += " \
>> +        ruby \
>> +        facter \
>> +        hiera \
>> +        ruby-shadow \
>> +        bash \
>> +"
>> +
>> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
>> +
>> +do_install_append() {
>> +    install -d ${D}${sysconfdir}/puppet
>> +    install -d ${D}${sysconfdir}/puppet/manifests
>> +    install -d ${D}${sysconfdir}/puppet/modules
>> +
>> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
>> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
>> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
>> +    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
>> +}
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>

-- 
Pablo Saavedra Rodiño
psaavedra@igalia.com | Mail
www.igalia.com       | Web


