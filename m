Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2763E00D81; Wed, 16 Sep 2015 13:08:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.179 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2F92E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:08:18 -0700 (PDT)
Received: by ykdg206 with SMTP id g206so230646735ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Sep 2015 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QoxdUNu1N3vbhVcy1RcVBQWBSt8yOLds3SCtFK14SUY=;
	b=Xp+tiVJVo+cw2t+5TsxoMo8kARYn+50Zhn3vz1pq9AltC9LMpZ1LZ1TjqrnfIiXhL9
	euZqMg1nxpwR0DLgLIAiV6ouYX9lkU/QIu11BkpD42fS2ouzYDHZhCebRPI4/HcanWXc
	GZ41ewiB+LFknN5blbMGwAJfgdbxoHLqPVIj2VTkzG9ZtWEvsCCQXcmkI5P3RCdHXA3P
	hYlCjz5UMDeKM3xyetJuiXlDAFQDI4HqFMh0YIPDpNjMIaRqLDykZJjqyutSjVoujhnj
	2as7eRkFKWwbAEA5pANgzY3PCBZkWrFuISg/DLWGjl29Y7Ag5TkAnLi7ThVML+VHJIVe
	qcvA==
MIME-Version: 1.0
X-Received: by 10.13.193.67 with SMTP id c64mr30307498ywd.68.1442434098004;
	Wed, 16 Sep 2015 13:08:18 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Wed, 16 Sep 2015 13:08:17 -0700 (PDT)
In-Reply-To: <1442324868-17713-1-git-send-email-mark.asselstine@windriver.com>
References: <1442324868-17713-1-git-send-email-mark.asselstine@windriver.com>
Date: Wed, 16 Sep 2015 16:08:17 -0400
Message-ID: <CADkTA4PNNKORNaxNHsdRFE9bLj0oyCR7VSgAMDauzvsjic3MDA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] ruby.bbclass: move to base layer
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
X-List-Received-Date: Wed, 16 Sep 2015 20:08:25 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Tue, Sep 15, 2015 at 9:47 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> In commit 1aa30310259027ebb87ee95ef914ca3de55d6a09 [puppet: move to
> base layer] we made puppet available to all sub-layers but since we
> didn't move the required ruby.bbclass we couldn't actually use it
> without using meta-openstack. Complete the move by moving the
> ruby.bbclass to the base layer. At some point I think we still want to
> remove ruby.bbclass from meta-cloud-services completely and use
> meta-ruby, but we will do that at another time.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  classes/ruby.bbclass                | 131 ++++++++++++++++++++++++++++++++++++
>  meta-openstack/classes/ruby.bbclass | 131 ------------------------------------
>  2 files changed, 131 insertions(+), 131 deletions(-)
>  create mode 100644 classes/ruby.bbclass
>  delete mode 100644 meta-openstack/classes/ruby.bbclass
>
> diff --git a/classes/ruby.bbclass b/classes/ruby.bbclass
> new file mode 100644
> index 0000000..0c842d5
> --- /dev/null
> +++ b/classes/ruby.bbclass
> @@ -0,0 +1,131 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#
> +DEPENDS += " \
> +    ruby-native \
> +"
> +RDEPENDS_${PN} += " \
> +    ruby \
> +"
> +
> +#${PN}_do_compile[depends] += "ruby-native:do_populate_sysroot"
> +
> +def get_rubyversion(p):
> +    import re
> +    from os.path import isfile
> +    import subprocess
> +    found_version = "SOMETHING FAILED!"
> +
> +    cmd = "%s/ruby" % p
> +
> +    if not isfile(cmd):
> +       return found_version
> +
> +    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
> +
> +    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
> +    m = r.match(version)
> +    if m:
> +        found_version = m.group(1)
> +
> +    return found_version
> +
> +def get_rubygemslocation(p):
> +    import re
> +    from os.path import isfile
> +    import subprocess
> +    found_loc = "SOMETHING FAILED!"
> +
> +    cmd = "%s/gem" % p
> +
> +    if not isfile(cmd):
> +       return found_loc
> +
> +    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
> +
> +    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
> +    for line in loc.split('\n'):
> +        m = r.match(line)
> +        if m:
> +            found_loc = m.group(1)
> +            break
> +
> +    return found_loc
> +
> +def get_rubygemsversion(p):
> +    import re
> +    from os.path import isfile
> +    import subprocess
> +    found_version = "SOMETHING FAILED!"
> +
> +    cmd = "%s/gem" % p
> +
> +    if not isfile(cmd):
> +       return found_version
> +
> +    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
> +
> +    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
> +    m = r.match(version)
> +    if m:
> +        found_version = m.group(1)
> +
> +    return found_version
> +
> +RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
> +RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
> +RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
> +
> +export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
> +
> +RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
> +RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
> +
> +RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
> +
> +ruby_do_compile() {
> +       for gem in ${RUBY_BUILD_GEMS}; do
> +               ${RUBY_COMPILE_FLAGS} gem build $gem
> +       done
> +}
> +
> +
> +ruby_do_install() {
> +       for gem in ${RUBY_INSTALL_GEMS}; do
> +               gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
> +       done
> +
> +       # create symlink from the gems bin directory to /usr/bin
> +       for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
> +               if [ -e "$i" ]; then
> +                       if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
> +                       b=`basename $i`
> +                       ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
> +               fi
> +       done
> +}
> +
> +EXPORT_FUNCTIONS do_compile do_install
> +
> +PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
> +
> +FILES_${PN}-dbg += " \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
> +        "
> +
> +FILES_${PN} += " \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
> +        "
> +
> +FILES_${PN}-doc += " \
> +        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
> +        "
> diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
> deleted file mode 100644
> index 0c842d5..0000000
> --- a/meta-openstack/classes/ruby.bbclass
> +++ /dev/null
> @@ -1,131 +0,0 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -DEPENDS += " \
> -    ruby-native \
> -"
> -RDEPENDS_${PN} += " \
> -    ruby \
> -"
> -
> -#${PN}_do_compile[depends] += "ruby-native:do_populate_sysroot"
> -
> -def get_rubyversion(p):
> -    import re
> -    from os.path import isfile
> -    import subprocess
> -    found_version = "SOMETHING FAILED!"
> -
> -    cmd = "%s/ruby" % p
> -
> -    if not isfile(cmd):
> -       return found_version
> -
> -    version = subprocess.Popen([cmd, "--version"], stdout=subprocess.PIPE).communicate()[0]
> -
> -    r = re.compile("ruby ([0-9]+\.[0-9]+\.[0-9]+)*")
> -    m = r.match(version)
> -    if m:
> -        found_version = m.group(1)
> -
> -    return found_version
> -
> -def get_rubygemslocation(p):
> -    import re
> -    from os.path import isfile
> -    import subprocess
> -    found_loc = "SOMETHING FAILED!"
> -
> -    cmd = "%s/gem" % p
> -
> -    if not isfile(cmd):
> -       return found_loc
> -
> -    loc = subprocess.Popen([cmd, "env"], stdout=subprocess.PIPE).communicate()[0]
> -
> -    r = re.compile(".*\- (/usr.*/ruby/gems/.*)")
> -    for line in loc.split('\n'):
> -        m = r.match(line)
> -        if m:
> -            found_loc = m.group(1)
> -            break
> -
> -    return found_loc
> -
> -def get_rubygemsversion(p):
> -    import re
> -    from os.path import isfile
> -    import subprocess
> -    found_version = "SOMETHING FAILED!"
> -
> -    cmd = "%s/gem" % p
> -
> -    if not isfile(cmd):
> -       return found_version
> -
> -    version = subprocess.Popen([cmd, "env", "gemdir"], stdout=subprocess.PIPE).communicate()[0]
> -
> -    r = re.compile(".*([0-9]+\.[0-9]+\.[0-9]+)$")
> -    m = r.match(version)
> -    if m:
> -        found_version = m.group(1)
> -
> -    return found_version
> -
> -RUBY_VERSION ?= "${@get_rubyversion("${STAGING_BINDIR_NATIVE}")}"
> -RUBY_GEM_DIRECTORY ?= "${@get_rubygemslocation("${STAGING_BINDIR_NATIVE}")}"
> -RUBY_GEM_VERSION ?= "${@get_rubygemsversion("${STAGING_BINDIR_NATIVE}")}"
> -
> -export GEM_HOME = "${STAGING_DIR_NATIVE}/usr/lib/ruby/gems/${RUBY_GEM_VERSION}"
> -
> -RUBY_BUILD_GEMS ?= "${BPN}.gemspec"
> -RUBY_INSTALL_GEMS ?= "${BPN}-${BPV}.gem"
> -
> -RUBY_COMPILE_FLAGS ?= 'LANG="en_US.UTF-8" LC_ALL="en_US.UTF-8"'
> -
> -ruby_do_compile() {
> -       for gem in ${RUBY_BUILD_GEMS}; do
> -               ${RUBY_COMPILE_FLAGS} gem build $gem
> -       done
> -}
> -
> -
> -ruby_do_install() {
> -       for gem in ${RUBY_INSTALL_GEMS}; do
> -               gem install --ignore-dependencies --local --env-shebang --install-dir ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/ $gem
> -       done
> -
> -       # create symlink from the gems bin directory to /usr/bin
> -       for i in ${D}/${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/*; do
> -               if [ -e "$i" ]; then
> -                       if [ ! -d ${D}/${bindir} ]; then mkdir -p ${D}/${bindir}; fi
> -                       b=`basename $i`
> -                       ln -sf ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin/$b ${D}/${bindir}/$b
> -               fi
> -       done
> -}
> -
> -EXPORT_FUNCTIONS do_compile do_install
> -
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev"
> -
> -FILES_${PN}-dbg += " \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/.debug \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
> -        "
> -
> -FILES_${PN} += " \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/cache \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/bin \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/specifications \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/build_info \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions \
> -        "
> -
> -FILES_${PN}-doc += " \
> -        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/doc \
> -        "
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

