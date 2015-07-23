/*
 * Copyright (C) 2015 Fondazione Istituto Italiano di Tecnologia
 * Authors: Silvio Traversaro
 * CopyPolicy: Released under the terms of the LGPLv2.1 or later, see LGPL.TXT
 *
 */

#ifndef IDYNTREE_TRANSFORM_H
#define IDYNTREE_TRANSFORM_H

#include <iDynTree/Core/Position.h>
#include <iDynTree/Core/Rotation.h>
#include <iDynTree/Core/TransformSemantics.h>

#include <string>

namespace iDynTree
{
    class Position;
    class Rotation;
    class Wrench;
    class Twist;
    class SpatialMomentum;
    class SpatialAcc;
    class SpatialInertia;

    class PositionSemantics;
    class RotationSemantics;

    /**
     * Class representation the relative displacement between two different frames.
     *
     * \ingroup iDynTreeCore
     *
     * The semantics for this class are lousely on the one of PoseCoord in:
     *
     * De Laet T, Bellens S, Smits R, Aertbeliën E, Bruyninckx H, and De Schutter J
     * (2013), Geometric Relations between Rigid Bodies: Semantics for Standardization,
     * IEEE Robotics & Automation Magazine, Vol. 20, No. 1, pp. 84-93.
     * URL : http://people.mech.kuleuven.be/~tdelaet/geometric_relations_semantics/geometric_relations_semantics_theory.pdf
     *
     * However this class is designed to be an easy to use proxy to perform change of frame of
     * expression for iDynTree::Position, iDynTree::Twist, iDynTree::Wrench. Hence with respect to
     * the PoseCoord we restrict the semantics to the one of the homogeneous transformation matrix
     * representation, enforcing that the reference orientation frame is always coincident with teh
     * coordinate frame . For this reason the class is called "Transform", because it will be mainly
     * used to transform quantities between frames.
     *
     * Given that this class it may used to represent homogeneous transform matrix as well as adjoint
     * matrix, no raw access to the underline storage ( data() method ) is provided, because it does not
     * have a canonical representation.
     */
    class Transform
    {
    protected:
        Position pos;
        Rotation rot;
        TransformSemantics semantics;

    public:
        /**
         * Default constructor: initialize the rotation to the identity and the translation to 0
         */
        Transform();

        /**
         * Constructor from a rotation and a point (can raise error on semantics of the passed elements)
         */
        Transform(const Rotation & _rot, const Position & origin);

        /**
         * Copy constructor: create a Transform from another Transform.
         */
        Transform(const Transform & other);

        /**
         * Destructor
         */
        virtual ~Transform();

        /**
         * Semantic accessor
         */
        TransformSemantics & getSemantics();

        /**
         * Const semantic getter
         */
        const TransformSemantics & getSemantics() const;

        /**
         * Get the rotation part of the transform
         */
        const Rotation & getRotation() const;

        /**
         * Get the translation part of the transform
         */
        const Position & getPosition() const;

        /**
         * Set the rotation part of the transform
         */
        void setRotation(const Rotation & rotation);

        /**
         * Set the translation part of the transform
         */
        void setPosition(const Position & position);

        // geometric operations on 3x1 vectors (positions and rotations and homogemeous tranform)
        static Transform compose(const Transform & op1, const Transform & op2);
        static Transform inverse2(const Transform & trans);

        /**
         * overloaded operators
         *
         * They overload geometric operations which are local functions in Transform.cpp. These functions are
         * not exported because they are templated, and exporting templates on Windows might cause compatibility
         * issues.
         */
        Transform operator*(const Transform & other) const;
        Transform inverse() const;
        Position operator*(const Position & other) const;
        Wrench   operator*(const Wrench & other) const;
        Twist    operator*(const Twist  & other) const;
        SpatialMomentum operator*(const SpatialMomentum & other) const;
        SpatialAcc   operator*(const SpatialAcc & other) const;
        SpatialInertia operator*(const SpatialInertia  & other) const;

        /**
         * constructor helpers
         */
        static Transform Identity();

        /** @name Output helpers.
         *  Output helpers.
         */
        ///@{
        std::string toString() const;

        std::string reservedToString() const;
        ///@}
    };
}

#endif