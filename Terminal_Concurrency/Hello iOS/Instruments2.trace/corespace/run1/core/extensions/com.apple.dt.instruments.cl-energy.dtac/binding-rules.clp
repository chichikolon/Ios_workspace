(deftemplate modeler-instance (slot instance) (slot from-rule-number))
(deftemplate modeler-instance-param (slot instance) (slot name) (multislot value))

(defrule binding-rule-1
    (declare (salience 101))
    (unbound-table-instance (table-id ?t0__) (has schema cl-energy-level))
    (unbound-table-instance (table-id ?t0__) (has target-pid $?target))
    =>
    (bind ?instance__ (create-modeler-instance))
    (assert (modeler-instance (instance ?instance__) (from-rule-number 1)))
    (bind-output-table ?t0__)
    (bind-input-table kdebug (attribute callstack user) (attribute codes "0x2d,*" ) (attribute target-pid $?target))
    (assert (modeler-instance-param (instance ?instance__) (name target) (value ?target)))
)
(defrule binding-rule-2
    (declare (salience 200))
    (unbound-table-instance (table-id ?t0__) (has schema cl-energy-level))
    (unbound-table-instance (table-id ?t0__) (has target-pid $?target))
    (unbound-table-instance (table-id ?t1__&~?t0__) (has schema cl-trace))
    (unbound-table-instance (table-id ?t1__) (has target-pid $?target))
    =>
    (bind ?instance__ (create-modeler-instance))
    (assert (modeler-instance (instance ?instance__) (from-rule-number 2)))
    (bind-output-table ?t0__)
    (bind-input-table kdebug (attribute callstack user) (attribute codes "0x2d,*" ) (attribute target-pid $?target))
    (assert (modeler-instance-param (instance ?instance__) (name target) (value ?target)))
    (bind-output-table ?t1__)
    (bind-input-table kdebug (attribute codes "0x2d,*" ) (attribute target-pid $?target) (attribute callstack user))
    (assert (modeler-instance-param (instance ?instance__) (name target) (value ?target)))
)
(defrule binding-rule-3
    (declare (salience 100))
    (unbound-table-instance (table-id ?t1__) (has schema cl-trace))
    (unbound-table-instance (table-id ?t1__) (has target-pid $?target))
    =>
    (bind ?instance__ (create-modeler-instance))
    (assert (modeler-instance (instance ?instance__) (from-rule-number 3)))
    (bind-output-table ?t1__)
    (bind-input-table kdebug (attribute codes "0x2d,*" ) (attribute target-pid $?target) (attribute callstack user))
    (assert (modeler-instance-param (instance ?instance__) (name target) (value ?target)))
)
