Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78B11E00B01; Thu, 20 Aug 2015 19:56:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 340A0E00AF2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Aug 2015 19:56:17 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7L2uFPK007086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Aug 2015 19:56:15 -0700 (PDT)
Received: from server.local (128.224.23.77) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 20 Aug 2015 19:56:14 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1440101641-13861-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <55D6934D.5020606@windriver.com>
Date: Thu, 20 Aug 2015 22:56:13 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1440101641-13861-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] puppet: back-port some patches to fix issues with Ruby >= 2.0.0
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
X-List-Received-Date: Fri, 21 Aug 2015 02:56:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-08-20 4:14 PM, Mark Asselstine wrote:
> We should uprev puppet at some point but for the sake of stabilizing
> first the following set of patches will allow puppet to work with the
> newer version of Ruby that we are using.
>
> The first two are upstream commits and the third is a commit which
> borrows a fix found in various puppet forks (repos which people host
> to stabalize older versions of puppet). With these patches puppet can
> now execute commands like 'help' and 'apply' without falling over.
>

No reason to sit on this .. since it can't be worse than it currently
is.

merged to master.

Bruce


> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   ...uplicate-key-which-ruby-2.2-complains-abo.patch | 30 ++++++++++++++++++
>   ...aint-Change-spec-test-to-pass-on-ruby-2.2.patch | 37 ++++++++++++++++++++++
>   ..._yaml-syck-isn-t-available-for-Ruby-2.0.0.patch | 35 ++++++++++++++++++++
>   recipes-support/puppet/puppet_3.7.3.bb             |  3 ++
>   4 files changed, 105 insertions(+)
>   create mode 100644 recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
>   create mode 100644 recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
>   create mode 100644 recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
>
> diff --git a/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch b/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
> new file mode 100644
> index 0000000..696c642
> --- /dev/null
> +++ b/recipes-support/puppet/puppet/MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch
> @@ -0,0 +1,30 @@
> +From 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 Mon Sep 17 00:00:00 2001
> +From: Jasper Lievisse Adriaanse <jasper@humppa.nl>
> +Date: Fri, 24 Jul 2015 20:18:08 +0200
> +Subject: [PATCH] (MAINT) Fix duplicate key which ruby 2.2 complains about
> +
> +commit 05dad9b1d30a8ff1e8e4a06bc5eaf0b19dab43e2 from
> +https://github.com/puppetlabs/puppet.git
> +
> +---
> + lib/puppet/defaults.rb | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/lib/puppet/defaults.rb b/lib/puppet/defaults.rb
> +index eeefefa..b591697 100644
> +--- a/lib/puppet/defaults.rb
> ++++ b/lib/puppet/defaults.rb
> +@@ -486,10 +486,6 @@ module Puppet
> +       :default    => "stomp",
> +       :desc       => "Which type of queue to use for asynchronous processing.",
> +     },
> +-    :queue_type => {
> +-      :default    => "stomp",
> +-      :desc       => "Which type of queue to use for asynchronous processing.",
> +-    },
> +     :queue_source => {
> +       :default    => "stomp://localhost:61613/",
> +       :desc       => "Which type of queue to use for asynchronous processing.  If your stomp server requires
> +--
> +2.1.4
> +
> diff --git a/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch b/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
> new file mode 100644
> index 0000000..73e1769
> --- /dev/null
> +++ b/recipes-support/puppet/puppet/maint-Change-spec-test-to-pass-on-ruby-2.2.patch
> @@ -0,0 +1,37 @@
> +From d183826136ca77847da5f3e460f2e460faabc5be Mon Sep 17 00:00:00 2001
> +From: Kylo Ginsberg <kylo@puppetlabs.com>
> +Date: Mon, 22 Dec 2014 10:11:38 -0800
> +Subject: [PATCH] (maint) Change spec test to pass on ruby 2.2
> +
> +commit d183826136ca77847da5f3e460f2e460faabc5be from
> +https://github.com/puppetlabs/puppet.git
> +
> +Prior to this change, this spec test failed on ruby 2.2.0-rc1 with:
> +
> +     Failure/Error: Time.stubs(:now).returns(Time.parse("2011-01-06 12:00:00 UTC"))
> +     NoMethodError:
> +       undefined method `utc_offset' for nil:NilClass
> +
> +I didn't track down the root cause of this failure, but just
> +normalized this stub to use Time.utc, which (along with Time.local)
> +is the more common way of stubbing Time objects in the codebase.
> +---
> + spec/unit/reports/store_spec.rb | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/spec/unit/reports/store_spec.rb b/spec/unit/reports/store_spec.rb
> +index 7f94f7d..f56eccd 100755
> +--- a/spec/unit/reports/store_spec.rb
> ++++ b/spec/unit/reports/store_spec.rb
> +@@ -24,7 +24,7 @@ describe processor do
> +     end
> +
> +     it "should write the report to the file in YAML" do
> +-      Time.stubs(:now).returns(Time.parse("2011-01-06 12:00:00 UTC"))
> ++      Time.stubs(:now).returns(Time.utc(2011,01,06,12,00,00))
> +       @report.process
> +
> +       File.read(File.join(Puppet[:reportdir], @report.host, "201101061200.yaml")).should == @report.to_yaml
> +--
> +2.1.4
> +
> diff --git a/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch b/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
> new file mode 100644
> index 0000000..1cd5e25
> --- /dev/null
> +++ b/recipes-support/puppet/puppet/safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch
> @@ -0,0 +1,35 @@
> +From fca1579d62d5b978375511e062b9c18f4413dd5a Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 20 Aug 2015 14:06:32 -0400
> +Subject: [PATCH] safe_yaml: syck isn't available for Ruby >= 2.0.0
> +
> +This change was taken from various puppet forks but does not exist in
> +puppet upstream as they drop support for YAML on the network as part
> +of work to fix PUP-3272.
> +
> +https://tickets.puppetlabs.com/browse/PUP-3272
> +
> +Community versions of this change:
> +https://github.com/kylog/puppet/commit/42b2e77ec24dfbbf2317d08615a35127afbc4782
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb b/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
> +index 8670ace..722dd3e 100644
> +--- a/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
> ++++ b/lib/puppet/vendor/safe_yaml/lib/safe_yaml.rb
> +@@ -3,7 +3,7 @@ require "yaml"
> + # This needs to be defined up front in case any internal classes need to base
> + # their behavior off of this.
> + module SafeYAML
> +-  YAML_ENGINE = defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : "syck"
> ++  YAML_ENGINE = defined?(YAML::ENGINE) ? YAML::ENGINE.yamler : (defined?(Psych) && YAML == Psych ? "psych" : "syck")
> + end
> +
> + require "set"
> +--
> +2.1.4
> +
> diff --git a/recipes-support/puppet/puppet_3.7.3.bb b/recipes-support/puppet/puppet_3.7.3.bb
> index 14e18d9..3e8f869 100644
> --- a/recipes-support/puppet/puppet_3.7.3.bb
> +++ b/recipes-support/puppet/puppet_3.7.3.bb
> @@ -7,6 +7,9 @@ SRC_URI = " \
>       https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
>       file://add_puppet_gemspec.patch \
>       file://puppet.conf \
> +    file://maint-Change-spec-test-to-pass-on-ruby-2.2.patch \
> +    file://MAINT-Fix-duplicate-key-which-ruby-2.2-complains-abo.patch \
> +    file://safe_yaml-syck-isn-t-available-for-Ruby-2.0.0.patch \
>   "
>   SRC_URI[md5sum] = "cc294da1d51df07bcc7f6cf78bd90ce0"
>   SRC_URI[sha256sum] = "4a3bd7ddb51072c3dd898a8de158cde204a2d8fd0b84e8ac806b84c074348637"
>


