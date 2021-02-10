Subject: Re: Importing Docker Images
To: meta-virtualization@lists.yoctoproject.org
From: "Diego Sueiro" <diego.sueiro@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.99.251)
X-Originating-Platform: Linux Chrome 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Feb 2021 23:55:58 -0800
References: <CADkTA4PJbhTb9kvaB5DxQC0wf=+u+FdAD_69Qid9rNsOaw1Mmw@mail.gmail.com>
In-Reply-To: <CADkTA4PJbhTb9kvaB5DxQC0wf=+u+FdAD_69Qid9rNsOaw1Mmw@mail.gmail.com>
Message-ID: <2819.1612943758573161988@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb  9, 2021 at 04:55 PM, Bruce Ashfield wrote:

>
> On Tue, Feb 9, 2021 at 11:22 AM Nathan Dunne <Nathan.Dunne@arm.com> wrot=
e:
> >
> > Hi,
> >
> > I am looking for some community feedback on whether it would make sens=
e to
> add support in meta-virtualization for including custom docker container=
 image
> tarballs. These container image tarballs would have been generated manua=
lly by
> using a "docker export" command.
>=20
> This is something we've talked about multiple times on the mailing
> list and at various conferences, and it really doesn't fit properly
> into the workflow.
>=20
> We run into licensing, reproducibility, development and compatibility
> issues very quickly.

These are very strong characteristics that make our current solution fragi=
le.

>=20
> I am working on extending the image-oci bbclass to use natively (OE)
> based images and pre-populate them to be runnable via
> podman/docker/runc at boot. That way, we have an integrated solution
> that leverages all of the OE advantages.
>=20
> (podman is actually easier than docker to do this on the build/cross sid=
e)
>=20
> >
> > Currently in meta-arm-autonomy we have:
> >
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm-autono=
my/recipes-containers/import-docker-image
> > Which allows a single image file to be included, then imported at boot=
 time.
> I am currently extending this to allow a list of image files rather than=
 only
> one, and to use docker-compose for easier control of multiple containers=
. This
> could live in meta-virtualization rather than meta-arm-autonomy if the
> community believes this a good idea.
>=20
> There are some points of collaboration, but as it currently sits (and
> is designed), there are the issues that I mention above that are a
> problem, before we'd want to endorse it as a supported / suggestion
> option.
>=20

Our main motivation with this recipe and following improvements described =
by
Nathan is that most of our users are interested in including their externa=
lly generated
workloads, as docker container images, in Xen guests filesystems. Some of =
these
workloads are based in Autoware which can't be built with bitbake at the m=
oment and
we also don't want to require the user to be experienced with bitbake/oe i=
n order to
have its workload integrated.

If your implementation supports pulling images from any user-defined image=
 hub I
think we can collaborate on both implementation and testing.

> I'll work on getting my WIP image class pushed to master-next as soon
> as possible, but I have some other pending issues to resolve first.
>=20
> Bruce
>=20
> >
> > Let me know what you think,
> > Nathan
> >
> >=20
> >
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
