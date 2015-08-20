Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A8B3E009B8; Thu, 20 Aug 2015 10:39:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8A25E00947
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Aug 2015 10:39:35 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7KHdYh8008741
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Aug 2015 10:39:34 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 20 Aug 2015 10:39:33 -0700
Message-ID: <55D610C2.3030704@windriver.com>
Date: Thu, 20 Aug 2015 13:39:14 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1440039372-3073-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/5] Fix the puppet run failure issue
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
X-List-Received-Date: Thu, 20 Aug 2015 17:39:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-08-19 10:56 PM, Mark Asselstine wrote:
> From: Guojian Zhou <guojian.zhou@windriver.com>
>
> The puppet's execution depends on the facter, so add the required
> RDEPENDS in the bb file.

merged to master.

Bruce

>
> The puppet tool run failure information:
> ==============================================
> root@# puppet help
> /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require': cannot load such file -- facter (LoadError)
> from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
> from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/lib/puppet.rb:6:in `<top (required)>'
> from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
> from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
> from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/lib/puppet/util/command_line.rb:12:in `<top (required)>'
> from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
> from /usr/lib64/ruby/rubygems/custom_require.rb:36:in `require'
> from /usr/lib64/ruby/gems/1.9.1/gems/puppet-3.7.3/bin/puppet:7:in `<top (required)>'
> from /usr/bin/puppet:23:in `load'
> from /usr/bin/puppet:23:in `<main>'
>
> Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   meta-openstack/recipes-support/puppet/puppet_3.7.3.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
> index afd9a23..22376cf 100644
> --- a/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
> +++ b/meta-openstack/recipes-support/puppet/puppet_3.7.3.bb
> @@ -18,6 +18,12 @@ DEPENDS += " \
>           hiera \
>   "
>
> +RDEPENDS_${PN} += " \
> +        ruby \
> +        facter \
> +        hiera \
> +"
> +
>   RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
>
>   do_install_append() {
>


