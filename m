Subject: Re: [PATCH 1/2] xen: Fix menuconfig
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: San Jose, California, US (217.140.99.251)
X-Originating-Platform: Windows Chrome 84
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 04 Aug 2020 23:57:19 -0700
References: <CACMJ4GbhFuOyGKVQn8u+VeWMXyAC_F-37huMKczibiHdAQyhCw@mail.gmail.com>
In-Reply-To: <CACMJ4GbhFuOyGKVQn8u+VeWMXyAC_F-37huMKczibiHdAQyhCw@mail.gmail.com>
Message-ID: <19886.1596610639405316859@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

Thanks for your comments and feedback.

Please, find my comments inline.

On Wed, Aug  5, 2020 at 06:25 AM, Christopher Clark wrote:

>
> On Tue, Aug 4, 2020 at 6:28 AM Diego Sueiro <diego.sueiro@arm.com> wrote=
:
> >
> > When building in OE environment the linker path needs to be passed whe=
n
> > buildind the Kconfig tool in order to get the menuconfig task properly
> > working.
>=20
> Hi Diego,
>=20
> Thank-you for working on fixing this - it is nice to see this tool
> working correctly again. I have some feedback inline below.
>=20
> > Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > ---
> >  ...g-Allow-specification-of-ncurses-location.patch | 55
> ++++++++++++++++++++++
> >  recipes-extended/xen/xen-hypervisor.inc            |  4 +-
> >  recipes-extended/xen/xen_4.14.bb                   |  1 +
> >  recipes-extended/xen/xen_git.bb                    |  1 +
> >  4 files changed, 60 insertions(+), 1 deletion(-)
> >  create mode 100644
> recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification=
-of-ncurses-location.patch
> >
> > diff --git
> b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specificati=
on-of-ncurses-location.patch
> > new file mode 100644
> > index 0000000..74c9cb0
> > --- /dev/null
> > +++
> b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specificati=
on-of-ncurses-location.patch
> > @@ -0,0 +1,55 @@
> > +Upstream-Status: Inappropriate [oe specific, cross compile issue]
>=20
> How have you arrived at this "Upstream-Status" for this patch?
> I ask because if it is possible to avoid carrying this patch in
> meta-virtualization indefinitely, it would be good to do so. Please
> can you submit it upstream for feedback and hopefully acceptance from
> the Xen maintainers?
>=20

I'll send it to the upstream project and update the Upstream-Status of thi=
s patch.
Like you mentioned below it will most probably have different variable nam=
es.

>=20
> > +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > +
> > +From d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 200=
1
> > +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> > +Date: Mon, 2 Jul 2018 23:10:28 -0400
> > +Subject: menuconfig,mconf-cfg: Allow specification of ncurses locatio=
n
> > +
> > +In some cross build environments such as the Yocto Project build
> > +environment it provides an ncurses library that is compiled
> > +differently than the host's version.  This causes display corruption
> > +problems when the host's curses includes are used instead of the
> > +includes from the provided compiler are overridden.  There is a secon=
d
> > +case where there is no curses libraries at all on the host system and
> > +menuconfig will just fail entirely.
> > +
> > +The solution is simply to allow an override variable in
> > +check-lxdialog.sh for environments such as the Yocto Project.  Adding
> > +a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> > +compiling and linking against the right headers and libraries.
>=20
> I think it's going to be good to get feedback from the Xen build
> system maintainers on whether these variable names are going to be
> acceptable upstream. It could make sense to add documentation for them
> to the INSTALL file at the head of the repository where some of the
> other build system variables are explained.
>=20

Thanks for the suggestion. Let's see how the review goes in the upstream p=
roject.

> > +
> > +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> > +cc: Michal Marek <mmarek@suse.cz>
> > +cc: linux-kbuild@vger.kernel.org
> > +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> > +---
> > + xen/tools/kconfig/mconf-cfg.sh | 8 ++++++++
> > + 1 file changed, 8 insertions(+)
> > + mode change 100755 =3D> 100644 xen/tools/kconfig/mconf-cfg.sh
> > +
> > +(limited to 'xen/tools/kconfig/mconf-cfg.sh')
> > +
> > +diff --git a/xen/tools/kconfig/mconf-cfg.sh
> b/xen/tools/kconfig/mconf-cfg.sh
> > +old mode 100755
> > +new mode 100644
> > +index c812872d7f9d..65a9b9e5b8a6
> > +--- a/xen/tools/kconfig/mconf-cfg.sh
> > ++++ b/xen/tools/kconfig/mconf-cfg.sh
> > +@@ -4,6 +4,14 @@
> > + PKG=3D"ncursesw"
> > + PKG2=3D"ncurses"
> > +
> > ++if [ "$CROSS_CURSES_LIB" !=3D "" ]; then
> > ++    echo libs=3D\'$CROSS_CURSES_LIB\'
> > ++    if [ x"$CROSS_CURSES_INC" !=3D x ]; then
> > ++      echo cflags=3D\'$CROSS_CURSES_INC\'
> > ++    fi
> > ++    exit 0
> > ++fi
> > ++
> > + if [ -n "$(command -v pkg-config)" ]; then
> > +       if pkg-config --exists $PKG; then
> > +               echo cflags=3D\"$(pkg-config --cflags $PKG)\"
> > +--
> > +cgit v1.2.2-1-g5e49
> > diff --git a/recipes-extended/xen/xen-hypervisor.inc
> b/recipes-extended/xen/xen-hypervisor.inc
> > index c386917..784059b 100644
> > --- a/recipes-extended/xen/xen-hypervisor.inc
> > +++ b/recipes-extended/xen/xen-hypervisor.inc
> > @@ -77,12 +77,14 @@ do_deploy[depends] +=3D "xen-tools:do_populate_sys=
root"
> >  do_deploy[depends] +=3D "xen-tools:do_deploy"
> >
> >  # Enable use of menuconfig directly from bitbake and also within the
> devshell
> > -OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> > +OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO
> CROSS_CURSES_LIB RECIPE_SYSROOT_NATIVE"
>=20
> Is there a reason for exporting RECIPE_SYSROOT_NATIVE?
>=20

If I don't export this variable the mconf-cfg.sh cannot resolve it.
I'll give a try by using the ${STAGING_LIBDIR_NATIVE} and see how it goes.

> >  HOST_EXTRACFLAGS =3D "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> >  HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
> >  TERMINFO =3D "${STAGING_DATADIR_NATIVE}/terminfo"
> >  do_devshell[depends] +=3D "ncurses-native:do_populate_sysroot"
> >
> > +CROSS_CURSES_LIB =3D "-lncurses -L$RECIPE_SYSROOT_NATIVE/usr/lib"
>=20
> Since this definition here doesn't use { braces }, the value of
> RECIPE_SYSROOT_NATIVE isn't substituted into CROSS_CURSES_LIB, and so
> it gets evaluated later when the mconf-cfg.sh script is run. It would
> be good to add a comment to explain why you're not making the
> substitution occur within the recipe instead.
>=20

I'll give it a try with braces and get rid of the extra export if it works=
.

> With adding /usr/lib as the suffix: would STAGING_LIBDIR_NATIVE be a
> more appropriate variable to use?
>=20

Agreed.

> Do you need to define and add CROSS_CURSES_INC to the terminal
> exports? It looks like that is actually introduced indirectly in the
> next commit in your series, so is this patch correct without doing
> that?
>=20

I have tested without the CROSS_CURSES_INC setting and it worked, this
is why I haven't added it in here.


> thanks
>=20
> Christopher
>=20
> > +
> >  KCONFIG_CONFIG_COMMAND ??=3D "menuconfig"
> >  python do_menuconfig() {
> >      import shutil
> > diff --git a/recipes-extended/xen/xen_4.14.bb
> b/recipes-extended/xen/xen_4.14.bb
> > index 0413bee..91e8988 100644
> > --- a/recipes-extended/xen/xen_4.14.bb
> > +++ b/recipes-extended/xen/xen_4.14.bb
> > @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "stable-${XEN_REL}"
> >  SRC_URI =3D " \
> >      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >      file://xen-arm64-implement-atomic-fetch-add.patch \
> > +  =20
> file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location=
.patch
> \
> >      "
> >
> >  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5"
> > diff --git a/recipes-extended/xen/xen_git.bb
> b/recipes-extended/xen/xen_git.bb
> > index 408bc3b..57791fc 100644
> > --- a/recipes-extended/xen/xen_git.bb
> > +++ b/recipes-extended/xen/xen_git.bb
> > @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D "master"
> >  SRC_URI =3D " \
> >      git://xenbits.xen.org/xen.git;branch=3D${XEN_BRANCH} \
> >      file://xen-arm64-implement-atomic-fetch-add.patch \
> > +  =20
> file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location=
.patch
> \
> >      "
> >
> >  LIC_FILES_CHKSUM ?=3D "file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5"
> > --
> > 2.7.4
> >
> >=20
>
